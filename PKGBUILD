# Maintainer: endaaman <ken@endaaman.com>

pkgname=tym
pkgver=3.6.1
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
depends=("vte3" "lua")
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("490e91e50f2e56ec840af0da56e0ce0c153b7cd6ba13ee8542c57f2a951dcfd8")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
