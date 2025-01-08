# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.44.0
pkgrel=1
pkgdesc='Simple tour through phosh'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh-tour'
license=(GPL-3.0-or-later)
depends=(libadwaita libgmobile)
makedepends=(meson git glib2-devel)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('681762eb4d5876ad5a365ea022ef96fa15b11a22ee5c5a2369d61e50925e58f7')

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="device"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
