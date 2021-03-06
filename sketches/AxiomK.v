Axiom K : forall {A} {x : A} (C : x = x -> Type),
  C eq_refl ->
  forall loop : x = x, C loop.

Lemma J : forall {A} {x : A} (C : forall y, x = y -> Type),
  C x eq_refl ->
  forall y (p : x = y), C y p.
Proof.
  intros; destruct p; assumption.
Qed.

Lemma all_refls :
  forall {A} {x : A} (p : x = x), p = eq_refl.
Proof.
  intros.
  eapply (K (fun x => x = eq_refl) _ p).
  Unshelve.
  { reflexivity. }
Qed.

Goal forall {A} {x y : A} (p q : x = y), p = q.
Proof.
  intros.
  destruct q.
  apply all_refls.
Qed.
