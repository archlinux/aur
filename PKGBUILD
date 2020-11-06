# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="lightpad"
pkgver="0.0.8"
pkgrel="1"
pkgdesc="A lightweight, simple and powerful application launcher. Writen in GTK+ 3.0. It is also Wayland compatible."
arch=('any')
url="https://github.com/libredeb/${pkgname}"
license=('GPL3')
depends=('gtk3' 'gnome-menus' 'libgee')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('59b4328c5c140c948f83007d003ad47486d1ba8c90842462a904574cf0e5dfe5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
