# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=1.10
pkgrel=1
pkgdesc="Rebuild man-db cache/purge ondemand  and speed up pacman operations."
arch=('any')
url="http://github.com/graysky2/mandb-ondemand"
license=('MIT')
depends=('systemd' 'man-db')
conflicts=('man-db-systemd')
replaces=('man-db-systemd')
optdepends=('gzip')
install=${pkgname}.install
source=(https://github.com/graysky2/${pkgname}/archive/v1.10.tar.gz)
sha256sums=('02cc1eb12a6dcd6d39ac11a5fe6fcc29928289c35a89d8ad419e061572e440a4')

build() {
  cd ${pkgname}-${pkgver}
	make
}

package() {
  cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
