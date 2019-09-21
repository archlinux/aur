# Maintainer:
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=dbus-cxx
pkgver=0.11.0
pkgrel=1
pkgdesc="A C++ wrapper for DBus"
url="https://dbus-cxx.github.io/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dbus' 'libsigc++' 'popt' 'glibmm')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('17aad1f785d42fb5602a90d34dbcc33de2ae3b636a03ccd4e5221d9fa1a7b8d8')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_GLIBMM=ON
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}
