# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.7
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('4d64f004deb6dc18d225d7842e4e408a187efab956e4b57b41d0ccd4e24d27828e1c641c3610cc020ff40841d078d1793b4eb032134c625a1d7ebe246eca84fc')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
