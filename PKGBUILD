# Maintainer: robertfoster

pkgname=ndpi
pkgver=3.0
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=('staticlibs' '!strip')
source=("https://github.com/ntop/nDPI/archive/$pkgver.tar.gz")

build() {
	cd ${srcdir}/nDPI-$pkgver
	./autogen.sh
        ./configure --prefix=/usr --with-pic --includedir=/usr/include --libdir=/usr/lib
	make
}

package() {
	cd ${srcdir}/nDPI-$pkgver
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/sbin"
}

md5sums=('e1df6041ca61e78284254e183741f51d')
