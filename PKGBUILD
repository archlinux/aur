# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-b-flags
_lastauthor=R/RU/RURBAN
_pkgname=B-Flags
pkgver=0.11
pkgrel=1
pkgdesc="Friendlier flags for B"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('daa1d1fa878be18458643458b00da1a715ed0ca3d5ec6e0a6a8ddace53f85e9a51da39590144bf366910b031a1251740c13fa9e5a5515be77878ec98dec742bf')

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

