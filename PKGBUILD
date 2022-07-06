# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=obs-websocket-compat-bin
_obsver=27.1.3
pkgver=4.9.1
_pkgver=5.0.0
pkgrel=1
pkgdesc="Remote-control of OBS Studio through WebSocket (4.9.1 backwards-compatible)"
arch=("x86_64")
url="https://github.com/obsproject/obs-websocket"
license=("GPL2")
depends=("obs-studio>=$_obsver")
source=("https://github.com/obsproject/obs-websocket/releases/download/$_pkgver/obs-websocket-$pkgver-compat-Ubuntu64.deb")
sha256sums=("ece5f376a8d9af341e85ea517dedb4436d62f38dbce75128ab155aca47622eb3")

build() {
	mkdir -p "${srcdir}/${pkgname}"
	tar xf data.tar.xz -C "${pkgname}"
	rm -r "${srcdir}/${pkgname}/usr/lib/x86_64-linux-gnu"
}

package() {
	cp -r "${srcdir}/${pkgname}/"* "${pkgdir}"
}
