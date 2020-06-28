# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.2.0
pkgrel=1
pkgdesc='A Keyboard userspace daemon'
arch=(x86_64)
url=https://github.com/Shatur95/akd
license=(GPL3)
depends=(libx11 boost)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('5966c69c2a435a5716675df8b8aa62a831b8b4aab620fde516b4aef178db4c37')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  cmake --build .
}

package() {
  cd $pkgname-$pkgver/build
  cmake --install .
}
