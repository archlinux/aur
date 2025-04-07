# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.2.3
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc' 'libunistring')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('16aba73e8af52842a0307ef5c7714fde6016d6da29c31b8b2a0d7b7df3634fe52121a0e30610fa88a6d504ce9c9021e2b8f459786efc3409f4572db9265c46f0')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c fumoutil.c fumolang.c -lm -lunistring
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
