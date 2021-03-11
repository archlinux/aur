# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.3.1
pkgrel=1
pkgdesc='A Keyboard userspace daemon'
arch=(x86_64)
url=https://github.com/Shatur95/akd
license=(GPL3)
depends=(libx11 boost-libs)
makedepends=(cmake boost)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('f122591371aad88025ebbd60559412e29def18cc68541795236e1441d93bea40')

build() {
  cd $pkgname-$pkgver

  cmake -B build -D CMAKE_INSTALL_PREFIX="$pkgdir/usr"
  cmake --build build
}

package() {
  cd $pkgname-$pkgver

  cmake --install build
}
