# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.5.6
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(x86_64)
depends=(kparts5 qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('713803095c56bf766171e3a911a0b5d9123acd0e53cb8680e05ab54b018929e7'
            'SKIP')
validpgpkeys=(0A48BC961075B4BA8523E3790A345FB086E797D9) # Friedrich W. H. Kossebau <kossebau@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
