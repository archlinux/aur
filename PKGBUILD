# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=1.3.1
pkgrel=1
pkgdesc='Small tool for quick text transformations such as hashes, encoding, decoding and so on'
arch=(x86_64 aarch64)
url='https://github.com/liferooter/textpieces'
license=(GPL3)
depends=(
	gtksourceview4
	libhandy
	python
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cc46cc4bf42bd0bdea11588c9a345c5473862891d6925e0d7becc233f0d0712')

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
