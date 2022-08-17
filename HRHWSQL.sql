--Ex1
SELECT e.first_name,e.last_name,e.department_id,d.department_name
FROM employees e join departments d
ON d.department_id=e.department_id;
--Ex2
 SELECT  e.first_name,e.last_name,e.department_id,d.department_name ,l.city,l.state_province
FROM employees e join departments d
ON d.department_id=e.department_id JOIN locations l 
ON l.location_id= d.location_id
--Ex3
select e.first_name,e.last_name,e.salary, jg.grade_level from employees e
join job_grades jg on e.salary >= jg.lowest_sal and e.salary <= jg.highest_sal
--Ex4
SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_id LIKE 80 OR d.department_id LIKE 40
--Ex5
SELECT e.first_name,e.last_name,d.department_name,l.city,l.state_province
FROM employees e JOIN departments d
ON e.department_id=d.department_id JOIN locations l
ON l.location_id=d.location_id
WHERE e.first_name LIKE '%z%'
--Ex6
SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id=d.department_id
--EX7
SELECT e.first_name,e.last_name,e.salary
FROM employees e
WHERE e.salary< (SELECT e.salary FROM employees e WHERE e.employee_id=182)
--EX8
select e.first_name, m.first_name from employees e
join employees m on e.manager_id = m.employee_id
--Ex9
SELECT d.department_name,l.city,l.state_province
FROM departments d JOIN locations l
ON d.location_id = l.location_id
--Ex10
SELECT e.first_name,e.last_name,d.department_id,d.department_name
FROM employees e  LEFT JOIN departments d
ON e.department_id=d.department_id
--Ex11
select e.first_name,m.first_name from employees e
left outer join employees m on e.manager_id = m.employee_id
--EX12
select e.first_name,e.last_name,e.department_id 
from employees e
join employees e2 on e.department_id = e2.department_id and e2.last_name = 'Taylor'
--EX13
SELECT e.first_name,d.department_name,j.job_title,jh.start_date,jh.end_date
FROM employees e JOIN job_history jh
ON e.job_id= jh.job_id JOIN jobs j 
ON j.job_id=jh.job_id JOIN departments d
ON d.department_id=jh.department_id
where jh.start_date  >= '1993-01-01' and jh.start_date <= '1997-08-31'
--Ex14
SELECT j.job_title,e.first_name,(j.max_salary-e.salary) Diffrences
FROM employees e JOIN jobs j
ON e.job_id=j.job_id

--Ex15
SELECT d.department_name,AVG(e.salary),COUNT(e.commission_pct)
FROM departments d JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
