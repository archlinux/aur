# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="budgie-lightpad-applet"
pkgver="0.0.2"
pkgrel="2"
_launchpad_rel="build1~groovy"
pkgdesc="A stylish panel applet that displays applications in a fullscreen desktop view."
arch=('i686' 'x86_64')
url="https://github.com/UbuntuBudgie/${pkgname}"
_launchpad_url="https://launchpad.net/~ubuntubudgie/+archive/ubuntu/backports"
license=('GPL3')
depends=('libpeas' 'lightpad' 'budgie-desktop')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

source=("${pkgname}-${pkgver}.tar.xz::${_launchpad_url}/+sourcefiles/${pkgname}/${pkgver}+build1~groovy/${pkgname}_${pkgver}+build1~groovy.tar.xz")
sha256sums=('08f324a62a3396bffb642092a53d7ca6593c634f882cf58dc12f8de454f2d1fc')

build() {
    cd "${pkgname}-${pkgver}+${_launchpad_rel}"
    arch-meson build --prefix=/usr --libdir=/usr/lib
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}+${_launchpad_rel}"
    DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
