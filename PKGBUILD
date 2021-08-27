# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hxl
pkgver=1.0
pkgrel=2
pkgdesc="Small, optimized terminal hex viewer"
arch=('x86_64')
url="https://github.com/sjmulder/hxl"
license=('BSD')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('819bfa6a3754ed3ddba7190656d12692a27d90c32c6fc5d13546f70563aa054b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
	install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
