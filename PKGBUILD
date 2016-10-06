# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=libkmfl
pkgver=0.9.8
pkgrel=1
pkgdesc="A Library for providing Keyman(C) services to Linux - runtime"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
source=("http://http.debian.net/debian/pool/main/libk/libkmfl/libkmfl_0.9.8.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/libk/libkmfl/libkmfl_0.9.8-1.diff.gz")
depends=('kmflcomp')
noextract=()
options=()
md5sums=('913fcd6567ade43ea8ec112cda3675dd' '963f4e4f5f97dc3e12586a08f892ca22')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/${pkgname}_$pkgver-$pkgrel.diff"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
