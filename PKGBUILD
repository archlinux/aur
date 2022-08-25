# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=headsetkontrol
pkgver=1.0.1
pkgrel=1
pkgdesc="Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework"
arch=('i686' 'x86_64')
url="https://gitlab.com/TheBill2001/HeadsetKontrol"
license=('GPL3')
depends=('kirigami2' 'ki18n' 'kconfig' 'kdbusaddons' 'knotifications' 'headsetcontrol')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('headsetkontrol-git' 'headsetkontrol-bin')
source=("$url/-/archive/v$pkgver/HeadsetKontrol-v$pkgver.tar.gz")
sha256sums=('300d0fe23b4a8d6291c5d75f3a780fdd73f251e7a7bd0f94b0426440dc8d7cb2')

build() {
    cmake \
        -S HeadsetKontrol-v$pkgver \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
