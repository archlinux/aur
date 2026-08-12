# Maintainer: endaaman <ken@endaaman.com>

pkgname=tym
pkgver=3.7.0
pkgrel=1
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
options=("!debug")
depends=("vte3" "lua")
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("1e1798602255394344c1c515e24c8f58d501b7b6ef65d60855f78b7a71d5bcac")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
