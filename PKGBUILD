# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atelier-git
confilicts=('atelier')
pkgver=36b7dda
pkgrel=1
pkgdesc="KDE 3D Printer Host"
arch=('i686' 'x86_64')
url="https://www.kde.org/"
license=('GPL3')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'qt5-charts' 'qt5-3d' 'solid' 'atcore' 'kxmlgui' 'ktexteditor' 'qwt' 'qt5-multimedia' 'gst-plugins-good') #Qt5)
source=('git://anongit.kde.org/atelier.git')
md5sums=(SKIP)

pkgver() {
  cd "atelier"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "atelier"
  cmake -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) -DCMAKE_BUILD_TYPE=Release CMakeLists.txt 
  make
}
package(){
  cd "atelier"
  make DESTDIR="$pkgdir/" install 
}  
