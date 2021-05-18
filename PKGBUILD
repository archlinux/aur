# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.3.2
pkgrel=1
pkgdesc='A Keyboard userspace daemon'
arch=(x86_64)
url=https://github.com/Shatur95/akd
license=(GPL3)
depends=(libx11 boost-libs)
makedepends=(cmake boost)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('dbc9737f9d05bef078b056978f0be2ca8dc0d48f4adae59bb13b4959c00c786c')

build() {
  cd $pkgname-$pkgver

  cmake -B build -D CMAKE_INSTALL_PREFIX="$pkgdir/usr"
  cmake --build build
}

package() {
  cd $pkgname-$pkgver

  cmake --install build
}
