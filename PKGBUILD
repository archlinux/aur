# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mkrom
pkgver=1.0.3
pkgrel=2
license=('MIT')
pkgdesc='Writes files into ROM images for TI calculators'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/mkrom'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7b52e19a5925bfc070dd7b0197860c45235984645d6065e51e1ea5bf6982ea2e')

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
