# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.3
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('9f7721fea7b41201c344021d38ff726c64cd7f2dbca4e86b4347282573733cc55857a45e35205a2d9b271801ec336b0df053e0c469e0007acded5b5d70594060')

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
