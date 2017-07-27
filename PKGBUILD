# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.5.4
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xproto")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip")
sha256sums=('f430c7b20f6d2d654054c341fece21221058f14eecb100ec591660650a4db3bd')

prepare() {
    cd ${srcdir}/${pkgname}
}

build() {
    cd ${srcdir}/${pkgname}

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNANA_CMAKE_NANA_FILESYSTEM_FORCE=YES

    make
}

package() {
    cd ${srcdir}/${pkgname}

    make DESTDIR="${pkgdir}" install
}
