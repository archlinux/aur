# Maintainer: Patrick josé Pereira  <gmail.com@patrickelectric>
pkgname=gcode3d-git
confilicts=('gcode3d')
pkgver=df9c77d
pkgrel=1
pkgdesc="GCode Visualizer"
arch=('i686' 'x86_64')
url="https://github.com/patrickelectric/Gcode3D"
license=('GPL2')
makedepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-declarative' 'qt5-canvas3d')
source=('git://github.com/patrickelectric/Gcode3D.git')
md5sums=(SKIP)

pkgver() {
  cd "Gcode3D"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "Gcode3D"
  mkdir "build" || true
  cd "build"
  cmake ..
  make
}

package(){
  cd "Gcode3D/build"
  make DESTDIR="$pkgdir" install
}
