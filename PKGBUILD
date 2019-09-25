# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=libparsifal
pkgver=1.1.0
pkgrel=1
pkgdesc="A a validating XML 1.0 parser written in ANSI C"
arch=('x86_64')
url="http://www.saunalahti.fi/~samiuus/toni/xmlproc/"
license=('custom:public domain')
depends=('glibc')
source=("http://www.saunalahti.fi/~samiuus/toni/xmlproc/libparsifal-$pkgver.tar.gz")
md5sums=('bee876fe8390cc835c4970047e38525d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
