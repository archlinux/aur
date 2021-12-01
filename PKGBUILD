# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kalendar
pkgver=0.3.0
pkgrel=1
pkgdesc='A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)'
arch=(x86_64)
url='https://apps.kde.org/kalendar/'
license=(GPL)
depends=(kdepim-runtime eventviews)
makedepends=(extra-cmake-modules boost)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('3787a00aceee34b495d76af4b740937515e8fc3768021bdb07229b6aaf5ca72b')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
