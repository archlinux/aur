# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.46.0
pkgrel=1
pkgdesc='Simple tour through phosh'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh-tour'
license=(GPL-3.0-or-later)
depends=(libadwaita libgmobile)
makedepends=(meson git glib2-devel)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('13807384e4c6012156a4aab2cf8ecbd4e14588f2fba02f46d1f04f98d68796d1')

build() {
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="device"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
