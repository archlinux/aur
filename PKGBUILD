# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=libunac
pkgver=1.8.0
pkgrel=1
pkgdesc="A C library removing accents from a string"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/unac/"
license=('GPL2')
source=("http://http.debian.net/debian/pool/main/u/unac/unac_$pkgver.orig.tar.gz")
sha512sums=('770508daabe7f1cf2fdd2c7cb0f88ed6363a091320547e1f5cafc32db6506c18548be98f6c5780757f3dc914c372a27a336865a0cd92c0a5503245fbb25ca3c8')

build() {
	cd "${srcdir}/unac-${pkgver}.orig"

    touch config.rpath
    ./autogen.sh
    
	./configure \
		--prefix=/usr

	make
}

package(){
	cd "${srcdir}/unac-${pkgver}.orig"

	make DESTDIR="${pkgdir}" install
}
