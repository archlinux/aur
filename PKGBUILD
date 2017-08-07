# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool
pkgver=0.5.14
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
source=("http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz")
sha256sums=('51c4af2e41300a8dea5a91d28fc953311229434210230c4e587eef70bee24ad5')

build() {
	cd "$srcdir"/slibtool-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool-$pkgver
	make DESTDIR="$pkgdir" install
}
