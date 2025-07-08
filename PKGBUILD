# Maintainer: Adrian Perez de Castro
pkgdesc='SVG optimizer'
pkgname=ohmysvg
pkgver=1.4
pkgrel=1
url=https://github.com/sonnyp/OhMySVG/
arch=(any)
license=(GPL-3.0-or-later)
depends=(gjs hicolor-icon-theme libadwaita)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('587939aeda42a416d680a3ed346be2645b669906c858b84a762989ace0b4d4f56174d7f95ee9e679e1021db6b9ed245e496381413718c6ccaf28b3282e0350fb')

build () {
	arch-meson _build "OhMySVG-${pkgver%.0}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
