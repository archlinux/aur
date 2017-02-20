# Maintainer: Alexander Ryapolov <srwork@gmail.com>

pkgname=qtvkbd
pkgver=0.8.0
pkgrel=1
pkgdesc="A virtual keyboard"
arch=(i686 x86_64)
url="https://github.com/Alexander-r/qtvkbd"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxtst')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/Alexander-r/qtvkbd.git#tag=v0.8")
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DDATA_INSTALL_DIR=/usr/share/apps \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
} 
