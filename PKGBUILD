# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinuxo.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cervisia
pkgver=20.08.1
pkgrel=1
pkgdesc='CVS Frontend'
url='https://kde.org/applications/development/cervisia/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdesdk)
depends=(kdesu kparts hicolor-icon-theme kinit)
makedepends=(extra-cmake-modules kdoctools)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('eedd3b3f00b97d513437fdbd2eeaa28cd6db29512983b82196bdededd8b701f2'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
