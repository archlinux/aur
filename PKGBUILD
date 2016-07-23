# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=2.01
pkgrel=1
pkgdesc="Rebuilds the manpage index database on-demand to speed-up pacman operations."
arch=('any')
url="http://github.com/graysky2/mandb-ondemand"
license=('MIT')
depends=('systemd' 'man-db')
conflicts=('man-db-systemd')
replaces=('man-db-systemd')
optdepends=('gzip')
install=${pkgname}.install
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('c0f83061b8e9c57b3ff6093f7106f919b45efc88d9363ccf6a4c5b7a07bf298a')

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
