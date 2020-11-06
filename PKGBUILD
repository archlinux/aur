# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="budgie-lightpad-applet"
pkgver="0.0.2"
pkgrel="1"
pkgdesc="A stylish panel applet that displays applications in a fullscreen desktop view."
arch=('i686' 'x86_64')
url="https://github.com/UbuntuBudgie/${pkgname}"
license=('GPL3')
depends=('libpeas' 'lightpad' 'budgie-desktop')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

source=("${pkgname}-${pkgver}.zip::${url}/archive/master.zip")
sha256sums=('9c8444aef500343906ce74de347403c21a01e05aa06e71fd30d2f2f0f5b717f8')

build() {
    cd "${srcdir}/${pkgname}-master"
    meson build --prefix=/usr --libdir=/usr/lib
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-master"
    DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
