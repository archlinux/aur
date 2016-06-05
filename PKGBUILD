# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-b-flags
_lastauthor=R/RU/RURBAN
_pkgname=B-Flags
pkgver=0.16
pkgrel=2
pkgdesc="Friendlier flags for B"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('0a3cba27289a295ca8443e21edd8316888418dcac3362f41022dd36da61c3fba2a4cd1706f99808b2ac7491431f31c7dd5910936e0e502ebdbe367698cea2d90')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

