# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-datetime-format-atom
_lastauthor=I/IK/IKEGAMI
_pkgname=DateTime-Format-Atom
pkgver=v1.0.2
pkgrel=1
pkgdesc="Parse and format Atom datetime strings"
arch=('any')
license=('CC0_1_0')
options=('!emptydirs')
depends=('perl-datetime-format-rfc3339')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3707b1aa56d9b548a71982efdd6d379759e727265bc234dfc05246923f669070')

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

