# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool
pkgver=0.5.34
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
source=("http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz")
sha256sums=('61ca7ca28a8d22c9eab7410c5aeebdd32b6d7a9e9060e3a9223edf1ad5daf6f8')

build() {
	cd "$srcdir"/slibtool-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool-$pkgver
	make DESTDIR="$pkgdir" install
}
