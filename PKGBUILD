# Maintainer: Adrian Perez de Castro
pkgdesc='SVG optimizer'
pkgname=ohmysvg
pkgver=1.0.0
pkgrel=1
url=https://github.com/sonnyp/OhMySVG/
arch=(any)
license=(GPL3)
depends=(gjs hicolor-icon-theme)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('decb4423611da1181fc6b8132af8bb103f904dff0b0e229ec1650ffd95a54c865ba4eb6036e6db9ddfc824f44c3923e9886c246a21b35d506c599ec2b372b4c5')

build () {
	arch-meson _build "OhMySVG-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
