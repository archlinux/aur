# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=open-isns
pkgver=0.94
pkgrel=1
pkgdesc='iSNS server and client for Linux'
arch=('i686' 'x86_64')
url='https://github.com/gonzoleeman/open-isns'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gonzoleeman/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac2c6f248ad824d4b9c083b5b3ff0342187edd9a8bed52b950a906817b3618b7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	autoreconf -fi
	./configure --prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/bin

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install install_lib install_hdrs
}

