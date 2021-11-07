# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kalendar
pkgver=0.1.0
pkgrel=2
pkgdesc='A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)'
arch=(x86_64)
url='https://apps.kde.org/kalendar/'
license=(GPL)
depends=(kdepim-runtime kpeople eventviews)
makedepends=(extra-cmake-modules boost)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('ebcde6030f666e2aa8754a73db2315972d29ab3706245e802c546c0cba75e19d')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
