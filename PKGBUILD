# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

pkgname=tym
pkgver=3.1.3
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha1sums=('e2cc1398701270033afac10f4c3af58b0541b2ec')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
