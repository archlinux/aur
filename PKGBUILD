# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=2.1.2
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
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d29bf4bee9f34c07f9898f916c05c092c515038cd28de1fce4b4f80b698361ba')

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
