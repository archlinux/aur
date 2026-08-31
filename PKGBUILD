# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-decoration
pkgver=6.7.4
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-decoration'
license=(LGPL-2.0-or-later)
depends=(glibc
         ki18n
         libstdc++
         qt6-base)
makedepends=(sonic-frameworks-cmake-modules)
provides=(kdecoration)
conflicts=(kdecoration)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7f57a78245a957d2818321e96ac0cd5e318505a86927914395d2bae6e6f74fb9')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
