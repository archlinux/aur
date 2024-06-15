# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.8
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('4cd9b9578fdda2c955cfdc75627d67769f906246ae54e29c11a1dfa691488a20c03654c7f940b24bbe511a57ba69c1c252aac3787ae47e196f7fb7a6048666cd')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
