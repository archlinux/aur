# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2022.10.1
pkgrel=1
pkgdesc="Tool to manage LEGO inventory offline for BrickLink."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt6-quick3d' 'hicolor-icon-theme' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('49cd2446c7805738ebfbe8ff7c0e19189c397c5661727ec194354baf5df93d59')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build . --config Release --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install . -v
}
