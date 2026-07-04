# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-decoration
pkgver=6.7.2
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-decoration'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         ki18n
         qt6-base)
makedepends=(sonic-frameworks-cmake-modules)
provides=(kdecoration)
conflicts=(kdecoration)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bdef02f3326a9b7bc8d622705932c8f2d6ef50304efe1495bdfd1e91cc502416')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
