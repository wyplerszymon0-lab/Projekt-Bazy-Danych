1.
SELECT *
FROM drug
LIMIT 5;

2.
SELECT *
FROM drug
WHERE drg_description LIKE '%przeciwzapalny%';

3.
SELECT *
FROM `order`
ORDER BY ord_audit_cd DESC;

4.
SELECT *
FROM `order`
WHERE ord_status = 'RECEIVED'
ORDER BY ord_audit_cd ASC;

5.
SELECT *
FROM `order`
WHERE ord_usr_id = 10
  AND ord_pha_id = 1
  AND ord_audit_cd LIKE '2025%'
ORDER BY ord_audit_cd DESC;

6.
SELECT 
    usr_id, 
    usr_enabled, 
    usr_name, 
    usr_surname, 
    usr_phone, 
    usr_audit_cd
FROM user;

7.
SELECT 
    o.ord_id, 
    p.pha_name, 
    u.usr_name, 
    u.usr_surname, 
    o.ord_status
FROM `order` o
JOIN pharmacy p ON o.ord_pha_id = p.pha_id
JOIN user u ON o.ord_usr_id = u.usr_id;

8.
SELECT 
    od.ori_ord_id, 
    d.drg_name, 
    od.ori_qty, 
    od.ori_price
FROM order_drug od
JOIN drug d ON od.ori_drg_id = d.drg_id;

9.
SELECT 
    ori_ord_id, 
    SUM(ori_qty * ori_price) AS total_order_value
FROM order_drug
GROUP BY ori_ord_id;
