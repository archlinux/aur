# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjs
pkgver=5.115.0
pkgrel=1
pkgdesc='Support for JS scripting in applications'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base pcre)
makedepends=(extra-cmake-modules kdoctools5)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('9cf4e00070586af43a21d5e4c30c61e66bc1c5f53952d4335bc7df44f9130432'
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
