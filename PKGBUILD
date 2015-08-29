# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=nagios-plugin-curl
pkgver=0.0.4
pkgrel=2
pkgdesc="curl-based web monitoring plugin for Nagios"
url="https://github.com/andreasbaumann/nagios-plugin-curl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('curl')
makedepends=('pkg-config')
source=("https://github.com/andreasbaumann/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2a559bd652d68c91b93fdfe5af01f96c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	mkdir -p $pkgdir/usr/lib/nagios/plugins
	install -D -m0755 src/check_curl $pkgdir/usr/lib/nagios/plugins
}
