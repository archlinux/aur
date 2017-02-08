# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flxmlrpc
pkgver=0.1.4
pkgrel=1
pkgdesc="XMLRPC for fldigi and other Ham Radio apps"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/downloads/flxmlrpc/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('automake' 'autoconf' 'pkg-config')
source=("http://www.w1hkj.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
	cd $pkgname-$pkgver

	autoreconf --install
	./configure --prefix=/usr
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('7e46519ca02561088bc824085f991006')
sha256sums=('ad72303e0da5fa179b11eb97e82e2bdf2d37241e53e8aad7266f8c30ff2ddd16')
