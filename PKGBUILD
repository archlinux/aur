# Maintainer: tibequadorian <tbqdrn at posteo dot de>

pkgname=maxflow
pkgver=3.0.5
pkgrel=1
pkgdesc='Software for computing mincut/maxflow in a graph'
url='https://github.com/gerddie/maxflow'
license=('GPL3')
arch=('x86_64')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gerddie/maxflow/archive/refs/tags/$pkgver.tar.gz")
md5sums=('4354e9a5cb02a97d424c89f07683f30e')

build() {
  cd $pkgname-$pkgver
  cmake -B build -S . -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
