# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=mandb-ondemand
pkgver=1.12
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
sha256sums=('84dc80ca3803164d9d3d6b82f0e068d28722e8195d065215d0f0aab79f14116c')

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
