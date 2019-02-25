# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mkrom
pkgver=1.0.1
pkgrel=1
license=('MIT')
pkgdesc='Writes files into ROM images for TI calculators'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/mkrom'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2c5c2e72f7f9a552c8f43015129e755f3d0a2a4c4152c615fcd7b9ed50ebf3c2')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
