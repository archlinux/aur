# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=rtptools
pkgver=1.21
pkgrel=1
pkgdesc="Number of small applications that can be used for processing RTP data."
url="http://www.cs.columbia.edu/IRT/software/rtptools/"
license=('custom')
arch=('i686' 'x86_64')
depends=(glibc)
source=(http://www.cs.columbia.edu/IRT/software/rtptools/download/$pkgname-$pkgver.tar.gz)
sha256sums=('2ddbf6d3a4dbdef26ca85e860f6795264a359d30e24fd63f14a8c4f7ca331830')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr 
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install
}
