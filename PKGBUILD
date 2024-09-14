# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=headsetkontrol
pkgver=2.0.3
pkgrel=1
pkgdesc="Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework"
arch=('i686' 'x86_64')
url="https://gitlab.com/TheBill2001/HeadsetKontrol"
license=('GPL3')
depends=('headsetcontrol' 'kirigami' 'kirigami-addons' 'ki18n' 'kcoreaddons' 'kconfig' 'kdbusaddons' 'knotifications' 'kiconthemes' 'kstatusnotifieritem' 'kxmlgui' 'knotifyconfig')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('headsetkontrol-git' 'headsetkontrol-bin')
source=("$url/-/archive/v$pkgver/HeadsetKontrol-v$pkgver.tar.gz")
sha256sums=('0cc50ce0471afb5bb342da671f1b8fe020a70bef48c3d8bde3dbf416e61fce1f')

build() {
    cmake \
        -S HeadsetKontrol-v$pkgver \
        -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
