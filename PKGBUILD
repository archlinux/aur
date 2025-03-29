# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-xtrans
pkgver=1.6.0
pkgrel=1
arch=('any')
pkgdesc="X transport library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-xtrans')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/xtrans-${pkgver}.tar.xz")
md5sums=('6ad67d4858814ac24e618b8072900664')

build() {
    cd "$srcdir/xtrans-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/xtrans-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
}
