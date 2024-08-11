# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.2
pkgrel=2
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc' 'libunistring')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('42346e9c4e880089703a1a93c84da8460e915a8867d3b6f5a2cd854489b565ef200c6ea5d82e5cf6558edbff8c1b1fa9778c56a2dbfcc9507f43977b6f03cc92')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c fumoutil.c fumolang.c -lm -lunistring
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
