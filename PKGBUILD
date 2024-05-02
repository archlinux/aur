# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

pkgname=tym
pkgver=3.5.1
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
depends=("vte3" 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("211e139df903e25fb819c635cca7442ead306d39b6807ba8ae5a808005154c12")
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
