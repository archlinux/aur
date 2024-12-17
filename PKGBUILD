# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>

pkgname=tym
pkgver=3.5.2
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
depends=("vte3" 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("fcec7ec3596ba09e2cbf3250153ac68dbdf1bee1d88f7e98f7e0ee0b6dbdad54")
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
