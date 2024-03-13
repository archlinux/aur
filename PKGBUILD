# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.2
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('038bcfcf8fba0d64df531766b227e5b0b167e5d83a21d27c4487eeda878d8d5bb8a39f33198cb55c5519ca3400d516f0ed3085ddae20ceb8acc5f91c93011678')

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
