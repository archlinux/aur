# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=2.3.3
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
sha256sums=('a6147fa2a1e3dd70b774d8e7b126642d5604791d295dae131823c0e3f8c27b17')

build() {
	arch-meson textpieces-${pkgver} build -Dtests=false
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
