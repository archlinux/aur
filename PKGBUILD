# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Simple and clean theme, based on original Adwaita'
pkgname=lounge-gtk-theme
pkgver=1.24
pkgrel=1
url=https://github.com/monday15/lounge-gtk-theme
conflicts=(lounge-gtk-theme-git)
arch=(any)
license=(GPL3)
depends=(gtk3)
makedepends=(meson sassc gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('bad9ccbfd0007c98a8a222a7fb3f7fec3d23e922bf894429d47367ee9036130bfede62f8bf08635b8efca5c834151635a585428975aefac16e5fdcd0f4fa0658')

build () {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	arch-meson build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
}
