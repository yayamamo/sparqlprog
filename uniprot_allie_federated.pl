
/*

  Example:
  
pl2sparql -e --consult examples/oma_ebi_federated.pl "orthologs_with_coordinates(ensembl:'ENSG00000198840',G2,Tax,E,R)"

  We pass the -e option to force execution within the prolog environment (rather attempting to compile the function)

  Within the prolog environment, the ?? predicate will explicitly invoke sparqlprog on an explicit endpoint

    */

:- use_module(library(sparqlprog/ontologies/uniprot)).
:- use_module(library(sparqlprog/ontologies/allie_sflf)).

:- rdf_register_prefix(uniprot,'http://purl.uniprot.org/uniprot/').

tell_me(P,L_engl,L1,L2) :- 
        ( uniprot ?? (annotation(P,A),disease_annotation(A),has_full_name(P,Y),encoded_by(P,G),pref_label(G,L))),
        ( allie ?? (L_engl is strlang(L,"en"), long_form_list(L_engl,L1,L2,"en"))).
