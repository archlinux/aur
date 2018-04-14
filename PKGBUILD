# $Id: PKGBUILD 141579 2015-09-24 15:22:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.0.2
pkgrel=3
pkgdesc="A note taking application for KDE"
url="https://www.kde.org/applications/utilities/kjots/"
arch=(x86_64)
license=(GPL)
depends=(kcmutils kontactinterface akonadi akonadi-notes kpimtextedit)
makedepends=(extra-cmake-modules kdoctools boost kdelibs4support)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('5359aefb7b44027d7abbdafb0d501a7b30695119d5d5c8a75cfcee98e428fae3')

prepare() {
  mkdir -p build
}

build() {
  cd build 
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

