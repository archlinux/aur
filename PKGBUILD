# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=genkfs
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='Builds KFS filesystems for KnightOS'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/genkfs'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('93690989819ee93dd5130b2761879deaa3d70c706b050bd31eb8d5997cb683e8')

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
