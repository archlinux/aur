# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=qfits
pkgver=6.2.0
pkgrel=1
pkgdesc="A stand-alone C library giving access to FITS file internals."
arch=(x86_64)
url="https://www.eso.org/sci/software/eclipse/qfits/"
license=('GPL')
options=(!buildflags)
source=("ftp://ftp.eso.org/pub/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3271469f8c50310ed88d1fd62a07c8bbd5b361e102def1dce3478d1a6b104b54')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
