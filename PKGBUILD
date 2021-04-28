# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='The glyph playground of creativity from simple lines'
pkgname=dot-matrix
pkgver=3.0.2
pkgrel=1
url=https://github.com/lainsce/dot-matrix
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
license=(GPL3)
arch=(x86_64)
makedepends=(vala meson)
depends=(libadwaita libgee)
sha512sums=('76ff21fbc4cbb0d07fb9a896f6db5a3abc703170c99ba83d96c7954a2abd53a15b711f33878328108c9d8d53add7bd41f4ab0f1609363beb077c820c5c91f0a7')

build () {
	rm -rf build
	arch-meson build "${pkgname}-${pkgver}"
	meson compile -C build
}

package () {
	meson install -C build --destdir "${pkgdir}"
}
