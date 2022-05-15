# Maintainer: Florian RICHER <florian.richer@protonmail.com>
pkgname=obs-websocket-bin
pkgver=4.9.1
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
source=("https://github.com/obsproject/obs-websocket/releases/download/$pkgver/obs-websocket_$pkgver-1_amd64.deb")

options=("!strip")
sha256sums=("15c487180a5124c6005e685640dedc7e8f8e0b95e3653425fac2e21e01104fdc")

build() {
  mkdir -p "${srcdir}/output"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}/usr"
}
