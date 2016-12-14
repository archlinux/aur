# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=nowdock-panel
pkgver=0.5.0
pkgrel=1
pkgdesc="Plasma 5 panel that that creates a plank or mac style zoom effect for its tasks"
arch=(i686 x86_64)
url="https://github.com/psifidotos/nowdock-panel"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules kdesignerplugin kdoctools python)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/nowdock-panel/archive/v$pkgver.tar.gz")
md5sums=('4ffa0f6dd9c56dc3f58cdd6e37e6efbf')
options=('!makeflags')

prepare() {
  mkdir -p $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
