# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=open-isns
pkgver=0.96
pkgrel=1
pkgdesc='iSNS server and client for Linux'
arch=('i686' 'x86_64')
depends=('openssl')
url='https://github.com/gonzoleeman/open-isns'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gonzoleeman/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('487fd0d87826423ea99dc159826d0b654a5da016ed670d4395a77bfa4f62e2ec')

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

