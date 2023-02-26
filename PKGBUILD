# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-mobile-settings
pkgver=0.24.1
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
)
makedepends=(
	git
	meson
	wayland-protocols
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0cac466fe7ad18af331a9199d165d77a3d841efe36c9074cccad7038b552ba86')

build() {
	arch-meson "${pkgname}-v${pkgver}" _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
