# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=2.03
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
sha256sums=('c6ced9e78bc96dc2c802a070a1c57c0cb7d45aaf1cd5737fc4185f4baf51e075')

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
