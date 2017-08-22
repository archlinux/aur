# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=jpcre2
pkgver=10.31.01
pkgrel=1
epoch=
pkgdesc="C++ wrapper for PCRE2 library"
arch=('any')
url="https://github.com/jpcre2/jpcre2"
license=('BSD')
groups=(jpcre2)
depends=('pcre2')
makedepends=()
checkdepends=(gcc)
optdepends=()
provides=(libjpcre2)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( "https://github.com/jpcre2/$pkgname/archive/$pkgver.tar.gz" )
noextract=()
md5sums=('524ebe07559a8885879226ebeff225c9')
validpgpkeys=('3331 6137 5B22 27AC F7AA  6351 A4A2 CA5B 6BDA A871')

prepare() {
	cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

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
