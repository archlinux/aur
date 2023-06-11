# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdav2
pkgver=0.4.0
pkgrel=1
pkgdesc='A DAV protocol implementation with KJobs'
arch=(x86_64)
url='https://community.kde.org/KDE_PIM'
license=(LGPL)
depends=(qt5-xmlpatterns kcoreaddons)
makedepends=(extra-cmake-modules)
#source=(https://download.kde.org/unstable/kdav2/$pkgver/src/$pkgname-$pkgver.tar.xz)
source=(https://invent.kde.org/pim/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('a4e5bcfdb276a64610f9d941ab5044c8c830d29a9dd3f26c4ad6a16e9f194ca5')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
