# Maintainer: derfenix@gmail.com 

pkgname=kquickimageeditor
pkgver=0.1
pkgrel=3
pkgdesc="Image editing components"
arch=('x86_64')
url="https://invent.kde.org/libraries/kquickimageeditor"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative')
makedepends=('extra-cmake-modules')
provides=('kquickimageeditor')
conflicts=('kquickimageeditor-git')
source=("$pkgname.tar.gz::https://invent.kde.org/libraries/kquickimageeditor/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d7648a806eca255be4d3acc7cb13a55907797471b8311bb9512ffc14599ed46e')

prepare() {
   mkdir build
}

build() {
  cd build
  cmake -S "../$pkgname-v$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd build
  make DESTDIR="$pkgdir" install
}
