# Maintainer: Adrian Perez de Castro
pkgdesc='SVG optimizer'
pkgname=ohmysvg
pkgver=1.1.0
pkgrel=2
url=https://github.com/sonnyp/OhMySVG/
arch=(any)
license=(GPL3)
depends=(gjs hicolor-icon-theme libadwaita)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('87f9b68ad3acedd121635fbe542d1094633f1a5dc172ce839cb55bc27bfda3340abeb81cefa8de6eda9fdfbe575901621a6d66d70e310fcc289fbdbecc8c1ecc')

build () {
	arch-meson _build "OhMySVG-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
