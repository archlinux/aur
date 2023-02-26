# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.24.0
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
sha256sums=("1f01ef314d1f76a04227a98fb262655122163ce5e2e8121801a4b07a37eb4b76")

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="phone"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
