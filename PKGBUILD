# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=zurl
pkgver=1.11.1
pkgrel=1
pkgdesc="HTTP and WebSocket client worker with ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('GPL3')
depends=("curl" "qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://github.com/fanout/zurl/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('fec50aa2c2ec61be10770d2806960a1286b837631a44d0a5e0a11cb1d5eb0508cb83167d697fdb6a097d2e3069b51c7abf27a535bb71d8053e95dc1c2d49a16a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --qtselect=5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
