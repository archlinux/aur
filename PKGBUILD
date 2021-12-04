# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='The glyph playground of creativity from simple lines'
pkgname=dot-matrix
pkgver=3.1.2
pkgrel=1
url=https://github.com/lainsce/dot-matrix
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
license=(GPL3)
arch=(x86_64)
makedepends=(vala meson)
depends=(libadwaita libgee)
b2sums=('6bcb5c00448b084bce404310b6821040bbd26a6e21dbf1f56572ef733e3e4e0e135b7190c53077c8db51d48daf9f1a05539a094aaf646ccde2a75be401418805')

build () {
	rm -rf build
	arch-meson build "${pkgname}-${pkgver}"
	meson compile -C build
}

package () {
	meson install -C build --destdir "${pkgdir}"
}
