# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-yaml'
pkgver='0.04'
pkgrel='1'
pkgdesc="DWIM loading of Moose objects from YAML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-blessed-reconstruct>=0.03' 'perl-sub-exporter>=0.982' 'perl-yaml' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/release/MooseX-YAML'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/MooseX-YAML-0.04.tar.gz')
md5sums=('93aabfe1628e003ba166fdd2fe2cfba1')
sha512sums=('6d39fdb9d71a96fda996828b48163fb5396f9fe03c30ba9198d74a7f77c6d9f73580a8fbbfee1035ab4b3bf81504d16269623848274d4938a3217f228b5b2ac4')
_distdir="MooseX-YAML-0.04"

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
