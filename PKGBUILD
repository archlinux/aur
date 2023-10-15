# Maintainer: Adrian Perez de Castro
pkgdesc='SVG optimizer'
pkgname=ohmysvg
pkgver=1.3.0
pkgrel=1
url=https://github.com/sonnyp/OhMySVG/
arch=(any)
license=(GPL3)
depends=(gjs hicolor-icon-theme libadwaita)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver%.0}.tar.gz")
b2sums=('32b0064c5f247111f62810e2ec47ede9d219f316b874544236bb442368bd3203fa267536936d67d5e857d585941e94927b6219937e08896e863be7ad775a49b6')

build () {
	arch-meson _build "OhMySVG-${pkgver%.0}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
