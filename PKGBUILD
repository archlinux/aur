# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=tpl
pkgver=1.6.1
pkgrel=1
pkgdesc="Efficient serialization in C."
arch=(any)
url="https://troydhanson.github.io/tpl/index.html"
license=('BSD')
source=("https://github.com/troydhanson/tpl/archive/v1.6.1.tar.gz")
md5sums=('e7b294ba0f544e21b450acb0622e180d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# Running bootstrap only once causes some files to be left missing
	./bootstrap
	./bootstrap
	./configure --prefix="$pkgdir/usr/"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	make install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
