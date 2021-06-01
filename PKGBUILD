# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc="A project management application intended for managing moderately large projects with multiple resources"
pkgver=3.3.0
pkgrel=2
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(akonadi-contacts kdiagram kactivities kholidays kcalendarcore kinit kparts qca-qt5)
makedepends=(extra-cmake-modules kdoctools)
conflicts=('calligra<3.1.0')
source=("https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz"{,.sig})
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
