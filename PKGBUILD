# Maintainer: callmetango

pkgname=sonic-breeze-sddm
pkgver=6.7.4
pkgrel=2
pkgdesc="Sonic Breeze SDDM Theme (KDE Plasma 6)"
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-breeze-sddm'
license=('LGPL-2.0-or-later')
depends=(sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8bbc86dc8213f62919de6e882a4a877bbfd1232de3ad1d9ef665ae0f82605c04')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
