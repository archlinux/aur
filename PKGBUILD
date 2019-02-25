# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=kpack
pkgver=1.0.11
pkgrel=1
license=('MIT')
pkgdesc='Manipulates KnightOS software packages'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kpack'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f4fe6141a4cdbb714327ddb96b790c2671b7ca138e6af299cf716ec5ab153d69')

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
