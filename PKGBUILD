# Maintainer: Thomas Booker <tw.booker@outlook.com>

pkgname=phosh-tour
pkgver=0.28.0
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
sha256sums=('0464a730a0d24172861101f84b7233f4bfc2ce7ab7514a1cd9a7e489a1b3a135')

build() {
	# TODO: -D brand
	arch-meson "${pkgname}-v${pkgver}" _build -D vendor="Arch Linux" -D brand="phone"
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
