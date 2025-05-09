# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-alsa-ucm-conf
pkgver=1.2.14
pkgrel=1
arch=('any')
pkgdesc="ALSA Use Case Manager configuration (and topologies) (Android ${_android_arch})"
url="https://alsa-project.org/"
license=('BSD-3-Clause')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("$url/files/pub/lib/alsa-ucm-conf-$pkgver.tar.bz2"{,.sig})
md5sums=('72c8bf33f1e0befd80e5e467e74f6b33'
         'SKIP')
validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

build() {
    cd "${srcdir}/alsa-ucm-conf-$pkgver"
}

package() {
    cd "${srcdir}/alsa-ucm-conf-$pkgver"
    source android-env ${_android_arch}

    install -vdm 755 "$pkgdir/${ANDROID_PREFIX_SHARE}/alsa/"
    cp -av ucm2 "$pkgdir/${ANDROID_PREFIX_SHARE}/alsa/"
}
