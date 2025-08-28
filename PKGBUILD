# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc='A project management application intended for managing moderately large projects with multiple resources'
pkgver=3.3.0
pkgrel=7
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(gcc-libs
         glibc
         kactivities5
         karchive5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdbusaddons5
         kdiagram5
         kholidays5
         ki18n5
         kiconthemes5
         kinit5
         kio5
         kitemviews5
         kjobwidgets5
         knotifications5
         kparts5
         kservice5
         ktextwidgets5
         kwallet5
         kwidgetsaddons5
         kwindowsystem5
         kxmlgui5
         qca-qt5
         qt5-base
         qt5-x11extras)
makedepends=(extra-cmake-modules
             kdoctools5)
source=(https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz{,.sig})
sha256sums=('9a97414f2207941a70d93ff096617365d35379cc93a09cfc19ee532d2905a9d8'
            'SKIP')
validpgpkeys=(05D00A8B73A686789E0A156858B9596C722EA3BD  # Boudewijn Rempt <foundation@krita.org>
              42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

build() {
  cmake -B build -S calligraplan-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
