# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mysql-router
pkgver=2.0.2
pkgrel=1
pkgdesc='Lightweight middleware that provides transparent routing between your application and any backend MySQL Servers'
arch=('i686' 'x86_64')
url='http://dev.mysql.com/downloads/router/'
license=('GPL')
makedepends=('cmake' 'doxygen')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=("http://cdn.mysql.com/Downloads/MySQL-Router/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('7bfe805e740a843e2cb38b8449345b03d9a08a35854923a86bdc8ff6be8a7c68'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

