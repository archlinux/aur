# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.41.0
pkgrel=1
pkgdesc='Simple tour through phosh'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh-tour'
license=(GPL-3.0-or-later)
depends=(libadwaita libgmobile)
makedepends=(meson git glib2-devel)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b30db6c25ab4ffb48edc7ad9658fa9ef9bcd9ca2d636c9ed159153777b2ac8c7')

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="device"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
