# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=jpcre2
pkgver=10.32.01
pkgrel=2
pkgdesc="C++ wrapper for PCRE2 library"
arch=('any')
url="https://github.com/jpcre2/jpcre2"
license=('BSD')
groups=(jpcre2)
depends=('pcre2')
provides=(libjpcre2 libjpcre2-dev)
source=( "https://github.com/jpcre2/$pkgname/archive/$pkgver.tar.gz" )
md5sums=('e66a2517c158803cf0cf96a294130915')
validpgpkeys=('3331 6137 5B22 27AC F7AA  6351 A4A2 CA5B 6BDA A871')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-test --enable-cpp11
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
