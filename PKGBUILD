# Maintainer: Antoine Viallon <antoine@lesviallon.fr>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=genkfs
pkgver=1.3.2
pkgrel=2
license=('MIT')
pkgdesc='Builds KFS filesystems for KnightOS'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/genkfs'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('374bf00749aa35af826efb36b8cbb939e25af8c668cc244c6aef8c9b8b827f2f')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
