# Maintainer: endaaman <ken@endaaman.com>

pkgname=tym
pkgver=3.5.2
pkgrel=2
pkgdesc="Lua-configurable terminal emulator"
arch=("x86_64")
url="https://github.com/endaaman/tym"
license=("MIT")
depends=("vte3" 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=("3d167d40fe108f4408cefd9346d074ae3028b94d06b99b2324f646ba1f3f3b0a")
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
