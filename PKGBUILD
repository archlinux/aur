# Maintainer: callmetango

pkgname=sonic-breeze-sddm
pkgver=6.7.5
pkgrel=1
pkgdesc="Sonic Breeze SDDM Theme (KDE Plasma 6)"
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-breeze-sddm'
license=('LGPL-2.0-or-later')
depends=(sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b2452f3984b14f037b2446a208fa3a4f18492c2e870559925357e069e4ef2409')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
