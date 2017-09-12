# Maintainer: Wilken 'Akiko' Gottwalt <akiko@mailbox.org>

pkgname=nana
pkgver=1.5.5
pkgrel=1
pkgdesc="An opensource cross-platform GUI library written in modern C++11 for static linking"
arch=("i686" "x86_64")
url="http://nanapro.org/en-us/"
license=("custom:Boost Software License")
depends=("alsa-lib" "libjpeg-turbo" "libpng" "libx11" "libxft")
makedepends=("alsa-lib" "cmake" "libjpeg-turbo" "libpng" "libx11" "libxft" "xproto")
source=("http://downloads.sourceforge.net/project/nanapro/Nana/Nana 1.x/${pkgname} ${pkgver}.zip")
sha256sums=('fb81ad8176a43bf779b22242ae1570a73a5150c300d087ebf3e9a0f69d88440d')

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
