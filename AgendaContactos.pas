PROGRAM Agenda_Contactos;

	{Membros do Grupo: Santos Ussene, Milton Miquitaio e Cleyton Israel M. F. Hung}
	
	USES CRT;

	VAR
		i, j, k, TotalContactos, menu : integer;
		aux, Pesquisar: string;
		nomes	: array[1..10] of string;
		Registo: ARRAY[1..10] OF RECORD
		nome, categoria: string [30];
		numero	: string[11];            
	END;

BEGIN

	i:= 1; {Iniciamos a variavel para contagem de registos}
	
	REPEAT
	
	writeln('===================================================');
	writeln('--------------- AGENDA DE CONTACTOS----------------');
	writeln('===================================================');
	writeln;
	writeln('||-------------- 1. Adicionar novo --------------||');
	writeln('||----------------- 2. Pesquisar ----------------||');	
	writeln('||----------------- 3. Ver Lista ----------------||');
	writeln('||------------------ 4. Alterar -----------------||');
	writeln('||------------------ 5. Remover -----------------||');
	writeln('||-------------------- 0. Sair ------------------||');
	writeln;
	write('||---------------------- Digite sua opcao: '); readln(menu);
	writeln;
	writeln;
	
	CASE menu OF
		
	1: BEGIN
		writeln;
		writeln('===================================================');
		writeln('------------------ NOVO CONTACTO ------------------');
		writeln('===================================================');
		writeln;
		write('||---------------------- Nome => '); readln(Registo[i].nome);
		write('||---------------------- Numero => '); readln(Registo[i].numero);
		write('||---------------------- Categoria => '); readln(Registo[i].categoria);
		writeln;
		writeln('||---------------------- Gravado com sucesso!...');
		writeln;
		writeln;
		readln;
		clrscr;
		i:= i + 1;
	END;
		
	2: BEGIN
		write('||---------------------- Digite o nome/categoria: ');  readln(Pesquisar);
		writeln('===================================================');
		writeln;
		writeln;
		IF ( Pesquisar <> '' ) THEN 
		BEGIN
			FOR j := 1 TO 10 DO
			BEGIN
				IF ( (Pesquisar = Registo[j].nome) OR (Pesquisar = Registo[j].categoria)  ) THEN
				BEGIN
					writeln('||---------------------- Nome => ', Registo[j].nome);
					writeln('||---------------------- Numero => ', Registo[j].numero);
					writeln('||---------------------- Categoria => ', Registo[j].categoria);
					writeln('---------------------------------------------------');
					writeln;
					writeln;
				END;
			END;
			
			IF ( (Pesquisar <> Registo[j].nome) OR (Pesquisar <> Registo[j].categoria)  ) THEN
			writeln('||---------------------- Contacto inexistente!...');
			writeln;
			writeln;
		END;
		readln;
		clrscr;
	END;
		
	3: BEGIN
		TotalContactos := 0;
		FOR j := 1 TO 10 DO
		BEGIN
			IF (Registo[j].nome <> '') THEN
			BEGIN
				writeln('||---------------------- Nome => ', Registo[j].nome);
				writeln('||---------------------- Numero => ', Registo[j].numero);
				writeln('||---------------------- Categoria => ', Registo[j].categoria);
				writeln('---------------------------------------------------');
				writeln;
				writeln;
				TotalContactos := TotalContactos + 1;
			END;		
		END;
		writeln('||---------------------- Total de Contactos: ', TotalContactos);
		writeln('||---------------------- Espaco disponivel: ', 10 - TotalContactos);
		writeln;
		writeln;
		readln;
		clrscr;		
	END;
		
	4: BEGIN
		write('||---------------------- Digite o nome para alterar: ');  readln(Pesquisar);
		writeln('===================================================');
		writeln;
		writeln;
		FOR j := 1 TO 10 DO
		BEGIN
			IF (Pesquisar = Registo[j].nome) THEN
			BEGIN
				write('||---------------------- Nome atual: (',Registo[j].nome,') - Alterar para => '); readln( Registo[j].nome );
				write('||---------------------- Numero atual: (',Registo[j].numero,') - Alterar para => '); readln( Registo[j].numero );
				write('||---------------------- Categoria atual: (',Registo[j].categoria,') - Alterar para => '); readln( Registo[j].categoria );
				writeln('---------------------------------------------------');
				writeln;
				writeln;
			END;
		END;		
		readln;
		clrscr;
	END;
	//
	5 : BEGIN
			Write('||---------------------- Digite o nome para eliminar: ');  readln(Pesquisar);
			writeln('===================================================');
			writeln;
			writeln;
			for j := 1 TO 10 DO
			BEGIN
				IF (Pesquisar = Registo[j].nome) THEN
				BEGIN
					Registo[j].nome		:= '';
					Registo[j].numero	:= '';
					Registo[j].categoria		:= '';
					writeln('||---------------------- Contacto eliminado!...');
					writeln;
					readln;
				END;
			END;
			readln;
			clrscr;
		END;
	END;
	
	UNTIL ( menu = 0 );
	readln;
	
END.
