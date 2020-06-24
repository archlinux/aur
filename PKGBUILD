# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-b-flags
_lastauthor=R/RU/RURBAN
_pkgname=B-Flags
pkgver=0.17
pkgrel=2
pkgdesc="Friendlier flags for B"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('ada4dc9880ae0fd207c5fd8e0afbd987290c4e3d87c404057af28a8cdb14a1158e37226ab558368a68644b617d908c932e1ef0b7c2fac9bec0107360e31229bd')

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

