# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kalendar
pkgver=0.2.0
pkgrel=1
pkgdesc='A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)'
arch=(x86_64)
url='https://apps.kde.org/kalendar/'
license=(GPL)
depends=(kdepim-runtime kpeople eventviews)
makedepends=(extra-cmake-modules boost)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('fdccb9d5226305a5a0b35651831dab4baecd2acef97b8283e3723a5ded049dfc')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
