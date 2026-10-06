# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-icon-themes
pkgver=6.30.0
pkgrel=2
pkgdesc='Support for icon themes'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-icon-themes'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         karchive
         kconfig
         ki18n
         kwidgetsaddons
         libstdc++
         qt6-base
         qt6-svg
         sonic-frameworks-color-scheme
         sonic-silver-icons)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('qt6-declarative: QML bindings')
provides=(kiconthemes)
conflicts=(kiconthemes)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bcffe3f58cd78b5b1dae0e85f8475479d227afbabea6f3c918739a0dee2bbc65')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
