# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmediaplayer
pkgver=5.101.0
pkgrel=1
pkgdesc='Plugin interface for media player features'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kparts)
makedepends=(extra-cmake-modules)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('084e0215dbe9c3a93b90de680f7a7302c3b0756557d130f977b221e1a5a04123'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
