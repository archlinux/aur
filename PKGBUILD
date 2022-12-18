# Maintainer: Guoyi Zhang
# contributor: FabioLolix

pkgname=notekit
pkgver=0.2.0
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64")
url="https://github.com/blackhole89/notekit"
license=("GPL3")
depends=("desktop-file-utils" "clatexmath" "gtkmm3" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson" "fontconfig" "appstream-glib")
source=("git+https://github.com/blackhole89/notekit.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${pkgname}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" meson install -C _build
}
