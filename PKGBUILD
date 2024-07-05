# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=molequeue
pkgver=0.9.0
pkgrel=4
pkgdesc='Desktop integration of high performance computing resources'
arch=(x86_64)
url='http://www.openchemistry.org/'
license=(BSD-3-Clause)
depends=(gcc-libs
         glibc
         qt5-base)
makedepends=(cmake
             git)
source=(git+https://github.com/OpenChemistry/molequeue#tag=$pkgver)
sha256sums=('3ef4ed58b137091f54d1f779c00f475c295b0abbc5d5112828c4ff29401cbb75')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
