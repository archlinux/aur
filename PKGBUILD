# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2022.9.3
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt6-base' 'qt6-quick3d' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('eac5e6f94bff690d6a7403a48784c19c095329b12a52b02f5495a5ce59a47a75')

build() {
  cd "$pkgname-$pkgver"
  /usr/lib/qt6/bin/qt-cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build . --config Release --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" cmake --install . -v
}
