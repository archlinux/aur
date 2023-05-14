# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.25.0
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
sha256sums=('aa9eefe42fc0a5b04bd128283c68e512eb080a9095520ef897d880c1ab70adc5')

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="phone"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
