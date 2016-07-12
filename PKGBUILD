# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=1.11
pkgrel=3
pkgdesc="Rebuild man-db cache/purge ondemand and speed up pacman operations."
arch=('any')
url="http://github.com/graysky2/mandb-ondemand"
license=('MIT')
depends=('systemd' 'man-db')
conflicts=('man-db-systemd')
replaces=('man-db-systemd')
optdepends=('gzip')
install=${pkgname}.install
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d8fb0c87836124fde930f300280ff01121891161d0d02a47ecef61224f565298')

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
