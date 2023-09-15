# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-mobile-settings
pkgver=0.31.0
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
sha256sums=('574bf44c5f232b1401b00b1082f1afb1f2b19d7e87b04a1662c5164b1f7c3eea')

build() {
	arch-meson "${pkgname}-v${pkgver}" _build
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
