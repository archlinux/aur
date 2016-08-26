# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=2.06
pkgrel=2
pkgdesc="Makes any pacman updates to the manpage index database much faster."
arch=('any')
url="http://github.com/graysky2/mandb-ondemand"
license=('MIT')
depends=('systemd' 'man-db')
conflicts=('man-db-systemd')
replaces=('man-db-systemd')
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('f38f4dbde4087704380d905fafb8334950e6a88600d1afbc1513c83c40f50d00')

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
