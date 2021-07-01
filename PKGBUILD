# Maintainer: Nikolai Hartmann <nikoladze@posteo.de>
pkgname=prmon
pkgver=2.2.1
pkgrel=1
pkgdesc="Standalone monitor for process resource consumption"
arch=('x86_64')
url="https://github.com/HSF/prmon"
license=('Apache')
makedepends=('cmake' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HSF/prmon/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("ac7f3fef14a7fa73c27df601ed8bd024")

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
