# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=slibtool
pkgver=0.7.3
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
arch=('x86_64' 'i686')
depends=("sh" "glibc")
source=("http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz")
sha256sums=('0308f8a7bc9b61c27229fb441fd5a04c9f77365bc6b72869d5c974811635ae25')

build() {
	cd "$srcdir"/slibtool-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/slibtool-$pkgver
	make DESTDIR="$pkgdir" install
}
