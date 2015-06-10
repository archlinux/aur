# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=rtptools
pkgver=1.20
pkgrel=3
pkgdesc="Number of small applications that can be used for processing RTP data."
url="http://www.cs.columbia.edu/IRT/software/rtptools/"
license=('custom')
arch=('i686' 'x86_64')
depends=(glibc)
source=(http://www.cs.columbia.edu/IRT/software/rtptools/download/$pkgname-$pkgver.tar.gz)
sha256sums=('99d681f6e328486fa1fc16581b0a5974e31eb2708101683ee9c8a0b6bed31050')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr 
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install
}
