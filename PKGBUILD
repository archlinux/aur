# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ripser
pkgver=1.2.1
pkgrel=1
pkgdesc="Computes Vietoris-Rips persistance barcodes"
arch=('x86_64')
url="https://github.com/ripser/ripser"
license=('MIT')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4be600591dced310550a78b718f3f4019f11049bad0fbf14eea1f85d835b16e1')

build() {
	cd "$pkgname-$pkgver"
	## from makefile
	c++ -std=c11 -Wall ripser.cpp -o ripser -DNDEBUG $CXXFLAGS $LDFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	install -D ripser -t "$pkgdir/usr/bin/"
	install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
