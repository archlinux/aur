# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool
pkgver=0.5.17
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
source=("http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz")
sha256sums=('de24fb363978531efac0d14392983c6600d180bc6bb2c33143fc42c99cd0b5a4')

build() {
	cd "$srcdir"/slibtool-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool-$pkgver
	make DESTDIR="$pkgdir" install
}
