# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-xorg-util-macros
pkgver=1.20.1
pkgrel=1
arch=('any')
pkgdesc="X.Org Autotools macros (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/util/util-macros-${pkgver}.tar.xz")
md5sums=('35a4f264a9852be4ae66f07d4100356e')

build() {
    cd "${srcdir}/util-macros-${pkgver}"

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/util-macros-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
