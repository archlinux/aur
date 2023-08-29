# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

pkgname=tym
pkgver=3.5.0
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
depends=("vte3" 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("69389000bd23c9b78b2debbec9353a89046f24dc2a6ee9edc36a2267a647e9f2")
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
