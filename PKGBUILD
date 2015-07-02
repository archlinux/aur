# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=errut
pkgver=1.0.1
pkgrel=1
pkgdesc="Set of simple error handling utilities in C++."
url="http://research.edm.uhasselt.be/~jori/page/index.php?n=Misc.ErrUt"
arch=('i686' 'x86_64')
license=('MIT')
depends=('cmake')
source=("http://research.edm.uhasselt.be/jori/errut/$pkgname-$pkgver.tar.bz2")
md5sums=('c8a7253f71a659434d835869f95c2428')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DLIBRARY_INSTALL_DIR=/usr/lib \
		..
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
}
