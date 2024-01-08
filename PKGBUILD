# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.0
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('e987d0c4a522d4299da7dbe7c9b414bdc744c6adcc9c72ff0809ac0c89ae8826bd18e546afa1954f784ab84c38f6db931a01aaf3ebd83e664e9b0ad6e6b11a6c')

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
