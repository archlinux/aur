# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=libhx
pkgver=3.23
pkgrel=1
pkgdesc="C/C++ library that provides data structures string formatting and autoresizing, option and config file parsing, type checking casts and more."
arch=(x86_64)
url="https://sourceforge.net/projects/libhx/"
license=('GPL')
depends=('glibc')
source=(https://sourceforge.net/projects/libhx/files/libHX/libHX-${pkgver}.tar.xz
        https://sourceforge.net/projects/libhx/files/libHX/libHX-${pkgver}.tar.asc)
md5sums=('4a304adb9658344f5bfac928cfaff0da'
         'SKIP')
validpgpkeys=('2F8BFE96D14F8B560FBC1F1DA28BDFEEB5A2B2FF')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
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
