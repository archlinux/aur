# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.36.0
pkgrel=1
pkgdesc='Simple tour through phosh'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/guidog/phosh-tour'
license=(GPL3)
depends=(
	libadwaita
)
makedepends=(
	git
	meson
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9b2097b9e84f13ac277c9132ff7bd8cb843d8b586541e3065f3d95bba1d2c7f4')

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="device"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
