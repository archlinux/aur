# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=jpcre2
pkgver=10.31.01
pkgrel=1
pkgdesc="C++ wrapper for PCRE2 library"
arch=('any')
url="https://github.com/jpcre2/jpcre2"
license=('BSD')
groups=(jpcre2)
depends=('pcre2')
provides=(libjpcre2)
source=( "https://github.com/jpcre2/$pkgname/archive/$pkgver.tar.gz" )
md5sums=('524ebe07559a8885879226ebeff225c9')
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
