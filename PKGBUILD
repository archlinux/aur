# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='The glyph playground of creativity from simple lines'
pkgname=dot-matrix
pkgver=3.2.0
pkgrel=1
url=https://github.com/lainsce/dot-matrix
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
license=(GPL3)
arch=(x86_64)
makedepends=(vala meson)
depends=(libadwaita libgee)
b2sums=('92cc7e7adfbb92b7814a78481ab1b72842d85b3694a5266a2527d7f29b6a5600a3186b8526a6c4d0b0164354f80984215f138ca36335694d4cdd3b9a142cf6cb')

build () {
	rm -rf build
	arch-meson build "${pkgname}-${pkgver}"
	meson compile -C build
}

package () {
	meson install -C build --destdir "${pkgdir}"
}
