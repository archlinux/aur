# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libqxp
pkgver=0.0.0
pkgrel=2
pkgdesc='library that parses the file format of QuarkXPress documents (v 3.1 to 4.1)'
url='https://wiki.documentfoundation.org/DLP/Libraries/libqxp'
arch=('i686' 'x86_64')
license=('MPL')
depends=('boost-libs' 'icu' 'librevenge')
makedepends=('boost' 'doxygen')
source=("http://dev-www.libreoffice.org/src/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0dd32afbf1c889debc28848b260c1bdc0eba5f57504476b787e164f7c59776d5')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-tests
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
