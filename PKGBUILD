# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-decoration
pkgver=6.7.5
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
sha256sums=('3b2bfb2c3af5453c616d4b1bbab8739fdc1e2b90bcfec9a6e942905c49cb143a')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
