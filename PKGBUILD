# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=libff7tk
pkgver=0.83.1
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
source=('https://github.com/sithlord48/ff7tk/archive/refs/tags/v0.83.1.tar.gz')
sha256sums=('94a33f0b9fa77c43d0a3bf47939b97e5bc43bc6e2ec5d8b732a59d00e2be4298')
options+=(!strip)

build() {
  cmake -S"ff7tk-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
