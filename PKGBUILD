# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-silver-icons
pkgver=6.30.0.1
pkgrel=1
pkgdesc='Silver icon theme'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-silver-icons'
license=(LGPL-3.0-or-later
         LGPL-2.1-only)
depends=(glibc
         qt6-base)
makedepends=(python-lxml
             sonic-frameworks-cmake-modules)
provides=(breeze-icons)
conflicts=(breeze-icons)
replaces=(sonic-frameworks-silver-icons)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('33f8ed0eab0ac8b4e0ebffc968bc4368d053ce749abb4d8e0d49b9e182250bbd')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
