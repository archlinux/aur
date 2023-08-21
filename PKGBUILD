# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-mobile-settings
pkgver=0.30.0
pkgrel=1
pkgdesc='A settings app for mobile specific things'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/guidog/phosh-mobile-settings'
license=(GPL3)
depends=(
	feedbackd
	libadwaita
	lm_sensors
	phoc
	phosh
)
makedepends=(
	git
	meson
	wayland-protocols
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2958f62b88816dbe89ee8b69c832e253d64596eb1234557f11bc3eb2c9abe050')

build() {
	arch-meson "${pkgname}-v${pkgver}" _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
