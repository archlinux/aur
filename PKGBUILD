# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-datetime-format-atom
_lastauthor=I/IK/IKEGAMI
_pkgname=DateTime-Format-Atom
_pkgver=v1.2.0
pkgver=1.2.0
pkgrel=1
pkgdesc="Parse and format Atom datetime strings"
arch=('any')
license=('CC0_1_0')
options=('!emptydirs')
depends=('perl-datetime-format-rfc3339')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}/"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('f9b78572d2505c24359a5f5adf201fd63f9f6f560d5a29d3f54e6587a61630b8')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${_pkgver}
  make test
}
package() {
  cd ${_pkgname}-${_pkgver}
  make install
}

