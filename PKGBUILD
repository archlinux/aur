# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=headsetkontrol
pkgver=2.0.4
pkgrel=4
pkgdesc="Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework"
arch=('i686' 'x86_64')
url="https://gitlab.com/billtran1632001/$pkgname"
license=('GPL3')
depends=('headsetcontrol' 'kirigami' 'kirigami-addons' 'ki18n' 'kcoreaddons' 'kconfig' 'kdbusaddons' 'knotifications' 'kiconthemes' 'kstatusnotifieritem' 'knotifyconfig')
makedepends=('cmake' 'extra-cmake-modules')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('360eaef86aa966cf20af567d38e04db6659134607174b92f9c87525f63d25208')

build() {
    cmake \
        -S $pkgname-v${pkgver} \
        -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
