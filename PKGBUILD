# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.0.2
pkgrel=1
pkgdesc='Small tool for quick text transformations such as hashes, encoding, decoding and so on'
arch=(x86_64 aarch64)
url='https://github.com/liferooter/textpieces'
license=(GPL3)
depends=(
	gtksourceview5
	libadwaita
	python
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a142104325e07aabfaf85b63e4f9e1f0c17a1b79fcc195803948151bcec9079')

build() {
	arch-meson textpieces-${pkgver} build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
