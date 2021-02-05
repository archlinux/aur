# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=patchrom
pkgver=1.1.3
pkgrel=2
license=('MIT')
pkgdesc='Patches jump tables into ROM dumps'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/patchrom'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e623900f96ed7d121a8ca3ebe966a3693d7ed2e58afbdd99a7d98d11891e73cb')

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
