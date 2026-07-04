# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-workspace-wallpapers
pkgver=6.7.2
pkgrel=1
pkgdesc='Additional wallpapers for the Sonic Workspace'
arch=(any)
url='https://github.com/Sonic-DE/sonic-workspace-wallpapers'
license=(LGPL)
makedepends=(qt5-base sonic-frameworks-cmake-modules)
provides=(plasma-workspace-wallpapers)
conflicts=(plasma-workspace-wallpapers)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1fea805436adc4113a0b2c860fd750085f132fa0742ac7c5fc13adf029a57c99')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
