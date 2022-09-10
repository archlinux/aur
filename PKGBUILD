# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=headsetkontrol
pkgver=1.0.2
pkgrel=1
pkgdesc="Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework"
arch=('i686' 'x86_64')
url="https://gitlab.com/TheBill2001/HeadsetKontrol"
license=('GPL3')
depends=('kirigami2' 'ki18n' 'kconfig' 'kdbusaddons' 'knotifications' 'headsetcontrol')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('headsetkontrol-git' 'headsetkontrol-bin')
source=("$url/-/archive/v$pkgver/HeadsetKontrol-v$pkgver.tar.gz")
sha256sums=('28cc2ef0ea766250cb9b3fef9109c271328282859975d21cc4fccb77a72e99f7')

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
