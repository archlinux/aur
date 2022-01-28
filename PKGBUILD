# Maintainer: Nikolai Hartmann <nikoladze@posteo.de>
pkgname=prmon
pkgver=3.0.1
pkgrel=1
pkgdesc="Standalone monitor for process resource consumption"
arch=('x86_64')
url="https://github.com/HSF/prmon"
license=('Apache')
makedepends=('cmake' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HSF/prmon/releases/download/v$pkgver/v$pkgver.tar.gz")
sha256sums=("f191ef32d2c0e5c655f8c0ab56b4585db859a5804176eb9e2c2e682dcc217c2c")

build() {
  mkdir build
  cd build
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
