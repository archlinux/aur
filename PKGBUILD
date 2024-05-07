# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=libff7tk
pkgver=1.1.0
pkgrel=1
provides=("libff7tk=${pkgver}")
conflicts=('libff7tk-git')
pkgdesc="Final Fantasy 7 Tool library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/sithlord48/ff7tk"
license=('LGPL3')
makedepends=('cmake' 'doxygen' 'clang')
depends=('qt6-base' 'qt6-tools' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'zlib') #Qt6)
install=$pkgname.install
source=("ff7tk::git+https://github.com/sithlord48/ff7tk.git#tag=v${pkgver}")
sha256sums=('bb139248fe99a9dd8d411bb3c86a30553c55e25d4399a1c90185c643f4f53f14')
options+=(!strip)

build() {
  cmake -S ff7tk -B build -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
