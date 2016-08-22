# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=2.05
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
sha256sums=('f33359bc907a8f9f984ad20df76646532f7b7b1854958cdeb3ede7e6552b6606')

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
