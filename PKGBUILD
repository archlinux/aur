# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-datetime-format-rfc3339
_lastauthor=I/IK/IKEGAMI
_pkgname=DateTime-Format-RFC3339
pkgver=v1.0.5
pkgrel=1
pkgdesc="Parse and format RFC3339 datetime strings"
arch=('any')
license=('CC0_1_0')
options=('!emptydirs')
depends=('perl-datetime')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('f7f35242b7c857bb4007a69dcbb3baed8c01e50c8d18449c978e9443cdfaee12')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
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

