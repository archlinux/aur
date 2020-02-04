# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=zurl
pkgver=1.11.0
pkgrel=1
pkgdesc="HTTP and WebSocket client worker with ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('GPL3')
depends=("curl" "qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2")
sha512sums=('099c6056d24c7b72722f0ca281c2308ea52caddc8a7ea1357290ba450a6fed338ac8ca16d4c38775064a1fe4861a7b3cad9a09c38abe1e20674fc4fad960e77b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --qtselect=5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
