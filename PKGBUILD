# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=khtml
pkgver=5.115.0
pkgrel=1
pkgdesc='KHTML APIs'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(giflib kparts5 kjs phonon-qt5)
makedepends=(extra-cmake-modules gperf)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('742a9965008d5205e92ece2a574b48f65452b17b8c4ce2176e0c25cc3be8cf60'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
