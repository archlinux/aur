# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=libff7tk
pkgver=Qt4.r127.g8d4bc34
pkgrel=1
pkgdesc="Final Fantasy 7 Tool library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/sithlord48/ff7tk"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('git://github.com/sithlord48/ff7tk.git')
md5sums=(SKIP)

pkgver() {
  cd "ff7tk"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "ff7tk"
  cmake -DDOCS=ON -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}
package(){
  cd "ff7tk"
  make DESTDIR="$pkgdir" install
}
