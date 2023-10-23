# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Charlie Wolf <charlie at wolf dot is>

pkgname=zurl
pkgver=1.12.0
pkgrel=1
pkgdesc="HTTP and WebSocket client worker with ZeroMQ interface"
arch=('x86_64' 'i686')
url="https://github.com/fanout/zurl"
license=('GPL3')
depends=("curl" "qt5-base" "zeromq")
makedepends=("qt5-base" "zeromq")
source=("https://github.com/fanout/zurl/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('3412119721b5ff2f5622d44cb6223b6a415b34d5b2528795c2a17138f607b21a1a51f44e03fa63f470c0bf28b29649471ecb1abc851f267af6b83687305fa0c6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --qtselect=5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
