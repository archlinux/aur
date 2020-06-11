# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.1.1
pkgrel=1
pkgdesc='A Keyboard userspace daemon'
arch=(x86_64)
url=https://github.com/Shatur95/akd
license=(GPL3)
depends=(libx11 boost)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('aa5f3d1b05409d0def6f001972f482ca8a05563f0a9ce0d2e76897360492b729')

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
