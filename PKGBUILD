# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kalendar
pkgver=0.3.1
pkgrel=1
pkgdesc='A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)'
arch=(x86_64)
url='https://apps.kde.org/kalendar/'
license=(GPL)
depends=(kdepim-runtime eventviews)
makedepends=(extra-cmake-modules boost)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('8300a40addb3cb294ccf6e7fb70dd570072b8828c5635f2008851248cc796dca')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
