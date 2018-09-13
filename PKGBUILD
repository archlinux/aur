# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool
pkgver=0.5.25
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
source=("http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz")
sha256sums=('6491b20b4fb247ba92c2babf73387f45eeb39a1f0e5f3f273d3359298332ed5c')

build() {
	cd "$srcdir"/slibtool-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool-$pkgver
	make DESTDIR="$pkgdir" install

	# This file makes no sense; if used, it would break compilations since
	# no libslibtool.so exists
	rm "$pkgdir"/usr/lib/pkgconfig/slibtool.pc
}
