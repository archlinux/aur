# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.5
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('8b671826ab86f680c0f1ac2806e12a90d034f52614911e7d1abbb65099c797d8d9a1710a0ade91b0995ba74798b4ab8ffb7a7ac05978eaf1f047f483098afc99')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
