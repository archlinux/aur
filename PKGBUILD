# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kimap2
pkgver=0.4.0
pkgrel=1
pkgdesc='Job-based API for interacting with IMAP servers'
arch=(x86_64)
url='https://community.kde.org/KDE_PIM'
license=(LGPL)
depends=(kcoreaddons kmime)
makedepends=(extra-cmake-modules)
#source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
source=(https://invent.kde.org/pim/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('32f9d47234a3aca6b87de3f4bc46c57b37c7f14396a6cf0d9da5a648aee9f5c4')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
