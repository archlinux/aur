# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=nfdump
pkgver=1.6.12
pkgrel=1
pkgdesc="A set of tools to collect and process netflow data."
arch=('i686' 'x86_64')
url="http://nfdump.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=('flex' 'bison')
source=("http://downloads.sourceforge.net/nfdump/$pkgname-$pkgver.tar.gz")
md5sums=('e55a9130c93cfb9ed24b01bccd691bcb')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/share/licenses/nfdump
	install -m644 "$srcdir/$pkgname-$pkgver/COPYING" $pkgdir/usr/share/licenses/nfdump
}
