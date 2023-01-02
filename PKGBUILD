# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Matrix <thysupremematrix a_t tuta d_o_t io>
# Contributor: Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-desktop-icons-ng
_pkgname=desktop-icons-ng
pkgver=47
pkgrel=5
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/rastersoft/desktop-icons-ng"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('meson' 'glib2')
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('520ae7bc4dfed49aaa17e379f21b694c51ffc789daad058c3b8617e02e4d0e24')

build() {
	arch-meson "${_pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
