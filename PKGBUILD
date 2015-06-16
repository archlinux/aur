# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-role-withoverloading'
pkgver='0.16'
pkgrel='1'
pkgdesc="Roles which support overloading"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.94' 'perl-aliased' 'perl-namespace-autoclean>=0.16' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/release/MooseX-Role-WithOverloading'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Role-WithOverloading-0.16.tar.gz')
md5sums=('ee16d43583203f01d9f27da3dddcdfbd')
sha512sums=('0255d2c2f5b21e996281d883c680564dfe4504a70e7a9bd1936a85ee77ceb6126f8778e8e1c1e46bf166b97f043052b9cb28d5e4f270c3ca852c35fd48522ae1')
_distdir="MooseX-Role-WithOverloading-0.16"

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
