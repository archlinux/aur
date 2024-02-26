# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('e8990e77bbab8a1b5e2c3dc5659c4c08cad8ad922eae7e6f829015738b7fc0160a2f2b9454639d188c4cc51c302050f3108690e65f7a63783107370ab50c4ebb')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir/" install
}
