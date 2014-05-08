# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-image-base-x11-protocol
_lastauthor=K/KR/KRYDE
_pkgname=Image-Base-X11-Protocol
pkgver=13
pkgrel=1
pkgdesc="Draw into an X11::Protocol"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl-x11-protocol-other' 'perl-image-base')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('9ceff8fe077e1bb1e12cff9e7804722d2f7dfa725ccb374139e463130b2ff82b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
