# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=kf5-kio-ftps
pkgver=0.3.1
pkgrel=2
pkgdesc="Implements the ftp encryption scheme called ftps, based on rfc 4217"
arch=(x86_64)
url="https://github.com/Akimkin/kf5-kio-ftps"
license=(GPL2)
depends=(kio5)
makedepends=(extra-cmake-modules kdelibs4support)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('da46c93a7e70ea98487ba911accf1e380e3da2abf64dd18ad37d45e12eda4ea5')

build() {
  cd "$srcdir"
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-I/usr/include/KF5/KDELibs4Support $CXXFLAGS"
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
