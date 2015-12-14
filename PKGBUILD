# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=open-isns
pkgver=0.95
pkgrel=1
pkgdesc='iSNS server and client for Linux'
arch=('i686' 'x86_64')
depends=('openssl')
url='https://github.com/gonzoleeman/open-isns'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gonzoleeman/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3508e89ffd745e0b2901ec52c491fa2fddee7a83adff575a8ecb712da80cdb2a')

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

