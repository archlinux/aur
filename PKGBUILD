# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.2.2
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc' 'libunistring')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('abce2eb1aa3bb01a14cf9c81252498f901f2920d01f63599beed1bff35d5ab276c4edd84c1be61f91c0ac5d53dd32e89a9859589fa8e241f8b94c57484840187')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c fumoutil.c fumolang.c -lm -lunistring
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
