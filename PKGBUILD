# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-xorg-util-macros
pkgver=1.20.2
pkgrel=1
arch=('any')
pkgdesc="X.Org Autotools macros (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
groups=('android-xorg-util-macros')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/util/util-macros-${pkgver}.tar.xz")
md5sums=('5f683a1966834b0a6ae07b3680bcb863')

build() {
    cd "${srcdir}/util-macros-${pkgver}"

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/util-macros-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
