# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=libff7tk
pkgver=1.0.0
pkgrel=1
provides=('libff7tk')
conflicts=('libff7tk-git')
pkgdesc="Final Fantasy 7 Tool library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/sithlord48/ff7tk"
license=('LGPL3')
makedepends=('cmake' 'doxygen' 'clang')
depends=('qt6-base' 'qt6-tools' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'zlib') #Qt6)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('https://github.com/sithlord48/ff7tk/archive/refs/tags/v1.0.0.tar.gz')
sha256sums=('067bc41efea4262dd3818fafbe1cd3e48b45ee88a4655dcbb6cb85213da1b3c5')
options+=(!strip)

build() {
  cmake -S"ff7tk-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
