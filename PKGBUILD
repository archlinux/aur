# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.4
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('6ee7aff01aabec63f1094ca88c7ec7913f7387e3d98168526345f3b15495af91ccf50a142a7345dbee20785591352df008f60f41e5123c8d276365f926343d89')

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
