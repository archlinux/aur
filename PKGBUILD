# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jakub Vitak <mainiak [at] gmail [dot] com>

pkgname=check_multi
pkgver=0.26
pkgrel=4
pkgdesc="multi purpose nagios wrapper plugin to display multiple lines of plugin output"
arch=('any')
url="http://my-plugin.de/wiki/projects/check_multi/start"
license=('GPL')
depends=('nagios-plugins')
source=("http://my-plugin.de/check_multi/${pkgname}-stable-${pkgver}.tar.gz")
sha256sums=('346cc4134d61c380475bd77217f226f4e0cb35819950a1cb3087f1afdbacf8cf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR=${pkgdir}/ install
}

