# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=headsetkontrol
pkgver=1.0.0
pkgrel=1
pkgdesc="Interface for HeadsetControl (by Sapd) written with Kirigami and KDE Framework"
arch=('i686' 'x86_64')
url="https://gitlab.com/TheBill2001/HeadsetKontrol"
license=('GPL3')
depends=('kirigami2' 'ki18n' 'kconfig' 'kdbusaddons' 'knotifications')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('headsetkontrol-git' 'headsetkontrol-bin')
source=("$url/-/archive/v$pkgver/HeadsetKontrol-v$pkgver.tar.gz")
sha256sums=('d5df7da1e4302fe9aa4499131213743c783eaf044b5d68d19fdaf900e104aeed')

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
