# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=patchrom
pkgver=1.1.2
pkgrel=1
license=('MIT')
pkgdesc='Patches jump tables into ROM dumps'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/patchrom'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('eff3116a838be361b73a5f86671ee0ddf5c4b1be4a89f1e04e04bd2f7d12f835')

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
