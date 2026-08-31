# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-icon-themes
pkgver=6.29.0
pkgrel=1
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
         sonic-frameworks-silver-icons)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
optdepends=('qt6-declarative: QML bindings')
provides=(kiconthemes)
conflicts=(kiconthemes)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3fb0fceb884566429abdfe7cf8a3e7a52feb797402fee4c5c83e1d979265396b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
