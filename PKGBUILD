# Maintainer: Seifane IDOUCHACH <seifane53@gmail.com>
pkgname=obs-websocket-bin
pkgver=5.0.1
_obsver=27.0.0
pkgrel=1
pkgdesc="Websockets API for obs-studio"
arch=("x86_64")
url="https://github.com/obsproject/obs-websocket"
license=("GPL2")
depends=("obs-studio>=$_obsver")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('libarchive')
source=("https://github.com/obsproject/obs-websocket/releases/download/$pkgver/obs-websocket-$pkgver-Ubuntu64.deb")

options=("!strip")
sha256sums=("47884be3c7afe087451e19591397caedcda2e9bce776419b05b906ffbcd08379")

build() {
  mkdir -p "${srcdir}/output"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}/usr"
}
