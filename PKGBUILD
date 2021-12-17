# Maintainer: Guoyi Zhang
pkgname=notekit
commit=844215a
pkgver=latest
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64")
url="https://github.com/blackhole89/notekit"
license=("GPL-3.0")
depends=("fontconfig" "clatexmath" "gtkmm3" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson")
provides=("notekit")
conflicts=("notekit-git")
source=("git+https://github.com/blackhole89/notekit.git#commit=${commit}")
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
