# Maintainer: Timothy Lee <timothy.ty.lee@gmail.com>
# Original packager: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=rtptools
pkgver=1.22
pkgrel=1
pkgdesc="Number of small applications that can be used for processing RTP data."
url="http://www.cs.columbia.edu/irt/software/rtptools/"
license=('BSD')
arch=('i686' 'x86_64')
depends=(glibc)
source=(http://www.cs.columbia.edu/irt/software/rtptools/download/$pkgname-$pkgver.tar.gz)
sha256sums=('2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr 
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install
}
