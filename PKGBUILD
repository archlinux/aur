# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=5.108.0
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules qt5-tools qt5-doc qt5-svg kpackage doxygen)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('77d9d13ab1188fc699914245b4bd6eb8bf1a44fb879e4fe84c3c9980f7c47f4d'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

