# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=2.04
pkgrel=1
pkgdesc="Makes any pacman updates to the manpage index database much faster."
arch=('any')
url="http://github.com/graysky2/mandb-ondemand"
license=('MIT')
depends=('systemd' 'man-db')
conflicts=('man-db-systemd')
replaces=('man-db-systemd')
install=${pkgname}.install
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('cf8286bf22eddfa349033554d6cf89e4c920f24fd5fc4748808b98c045c183ef')

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
