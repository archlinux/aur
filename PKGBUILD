# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-silver-icons
pkgver=6.29.0
pkgrel=2
pkgdesc='Silver icon theme'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-silver-icons'
license=(LGPL-3.0-or-later
         LGPL-2.1-only)
depends=(glibc
         qt6-base)
makedepends=(python-lxml
             sonic-frameworks-cmake-modules)
provides=(breeze-icons)
conflicts=(breeze-icons)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('041153ad4fe6fc8e81f4096298091aaf76b23d6ea61c406b19b4fabc32fa7d17')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
