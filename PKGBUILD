# Mantainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-x11-protocol-other
_lastauthor=K/KR/KRYDE
_pkgname=X11-Protocol-Other
pkgver=29
pkgrel=1
pkgdesc="Extra extransions for perl-x11-protocol"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl-x11-protocol')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('04e96a3f068eca498b7e91fe0abe24173b4152c91b556e21d84d4a802cffbd5f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make install
}
