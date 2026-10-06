# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-silver-style
pkgver=6.7.5
pkgrel=1
pkgdesc='Silver Qt Quick Controls style for SonicDE'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-quick-silver-style'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         libstdc++
         qt6-base
         qt6-declarative
         sonic-frameworks-color-scheme
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-quick-ui)
makedepends=(sonic-frameworks-cmake-modules)
provides=(qqc2-breeze-style)
conflicts=(qqc2-breeze-style)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('056b0205f9ca0d7be21647841368505d8a1290daabbd121b029ce993ff4baaed')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
