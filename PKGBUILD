# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-meta-typeconstraint-forcecoercion'
pkgver='0.01'
pkgrel='1'
pkgdesc="Force coercion when validating type constraints"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-namespace-autoclean')
makedepends=()
url='https://metacpan.org/release/MooseX-Meta-TypeConstraint-ForceCoercion'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/MooseX-Meta-TypeConstraint-ForceCoercion-0.01.tar.gz')
md5sums=('6208f4c7be243d911d26e6cbfca6bc6b')
sha512sums=('424ffc228cd96aa3c780e00129f5832ef6dcada019a05b4c56576da3c347f2dd88c1438418484bcb30abee57ef666073c41b200620bb1f6a5b124a855a37f77c')
_distdir="MooseX-Meta-TypeConstraint-ForceCoercion-0.01"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
