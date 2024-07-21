# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.10
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('56857f4a2ab65a9d43160dd6a845662e9429018e3782174ae4d138b305873e1e03a7cbc92a43b0991125c458150d76b9bbfa01a9d95e3af4f71df73d4ece3e83')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c -lm
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
