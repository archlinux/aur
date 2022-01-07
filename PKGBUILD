# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Felix Yan <felixonmars at archlinux dot org>

pkgname=fcitx-qt5-qt6
_pkgname=fcitx-qt5
pkgver=1.2.7
pkgrel=1
pkgdesc="Qt5 and Qt6 IM Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-qt5"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base' 'qt6-base')
makedepends=('extra-cmake-modules')
conflicts=('fcitx-qt5')
provides=('fcitx-qt5')
source=("https://download.fcitx-im.org/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=('1deb2e6cfccaae06ec3d0f3126d463773d9977cd5616bd15b20a668a5b08ae6d0ccb4212393a2ffdca90c247250cd58735e49e4fdda1941b805c86caf29cfcb3'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
    cd ${_pkgname}-${pkgver}

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_QT6=On .
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make install DESTDIR="${pkgdir}"
}
