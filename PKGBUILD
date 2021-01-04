# Maintainer: Timothy Lee <timothy.ty.lee@gmail.com>
# Original packager: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=rtptools
pkgver=1.22
pkgrel=2
pkgdesc="Number of small applications that can be used for processing RTP data."
url="https://github.com/irtlab/rtptools"
license=('BSD')
arch=('i686' 'x86_64')
depends=('autoconf' 'automake' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/irtlab/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac6641558200f5689234989e28ed3c44ead23757ccf2381c8878933f9c2523e0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	autoreconf --install --force
	./configure --prefix=/usr 
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install
}
