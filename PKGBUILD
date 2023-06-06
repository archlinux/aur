# Maintainer: Adrian Perez de Castro
pkgdesc='SVG optimizer'
pkgname=ohmysvg
pkgver=1.2.0
pkgrel=1
url=https://github.com/sonnyp/OhMySVG/
arch=(any)
license=(GPL3)
depends=(gjs hicolor-icon-theme libadwaita)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver%.0}.tar.gz")
b2sums=('7af2eecf131b75b6cb87a13aec76651a865ab4deccc5e72edd568edada46ff865dec208c6061a9d22844fbea3d8e39d66353af11ad2cf457ce8d8a0d5ce304a4')

build () {
	arch-meson _build "OhMySVG-${pkgver%.0}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
