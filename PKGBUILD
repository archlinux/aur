# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-xorg-util-macros
pkgver=1.20.0
pkgrel=1
pkgdesc="X.Org Autotools macros"
arch=('any')
license=('custom')
url="https://xorg.freedesktop.org/"
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("${url}/releases/individual/util/util-macros-${pkgver}.tar.xz")
sha512sums=('76caefb118bf1675d7b2b96e1bbb04eb9a320b02e120839e55a22ef98538ecf00d0e686a67186fc8fdc8492d277ffe3125ae8b7ac61ce4739edc0de3f468d2eb')

build() {
    cd "util-macros-${pkgver}"

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "util-macros-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
