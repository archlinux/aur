# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gcomplex'
pkgver='0.04'
pkgrel='1'
pkgdesc="Generic complex number library."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl')
makedepends=()
optdepends=('perl-math-anynum: support for arbitrary large numbers')
url='https://metacpan.org/release/Math-GComplex'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-GComplex-${pkgver}.tar.gz")
md5sums=('3df7165dcadaa33c00c13d1fa48f13a7')
sha512sums=('02ced1afcab2af0cb18e880e68f450cde1aa8670c160879bba62f3594cd52ec6e2ae6653632bb0de4b7f740950ef52a77ec2aa547453c000b067e08b6f740f5f')
_distdir="Math-GComplex-${pkgver}"

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
