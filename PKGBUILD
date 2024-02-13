# Maintainer: Aaron Cottle <a@aaroncottle.au>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kstatusnotifieritem-git
pkgver=5.249.0
pkgrel=1
pkgdesc='Implementation of Status Notifier Items'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kwindowsystem-git
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules-git
             qt6-doc
             qt6-tools)
source=(git+https://invent.kde.org/frameworks/kstatusnotifieritem.git)
sha256sums=('SKIP')

conflicts=('kstatusnotifieritem')
provides=('kstatusnotifieritem')

build() {
  cmake -B build -S kstatusnotifieritem \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
