# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mktiupgrade
pkgver=1.1.6
pkgrel=2
license=('MIT')
pkgdesc='Builds and signs OS upgrades for Texas Instruments calculators'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/mktiupgrade'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5e632f4ad06f4c8e276f9d2493b98032ebc313ea2a94b4bffd66948d02505781')

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
