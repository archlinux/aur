# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kalendar
pkgver=0.2.1
pkgrel=1
pkgdesc='A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)'
arch=(x86_64)
url='https://apps.kde.org/kalendar/'
license=(GPL)
depends=(kdepim-runtime kpeople eventviews)
makedepends=(extra-cmake-modules boost)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('d432460bb456cb3624b8ca1becbb6417ebe952b34648975c04b16aa9ce203398')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
