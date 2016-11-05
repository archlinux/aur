# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atcore-git
confilicts=('atcore')
pkgver=707e566
pkgrel=1
pkgdesc="KDE 3D Printing"
arch=('i686' 'x86_64')
url="https://github.com/KDE/atcore"
license=('LGPL3')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'solid') #Qt5)
#install=$pkgname.install
source=("git://github.com/kde/atcore.git")
md5sums=(SKIP)

pkgver() {
  cd "atcore"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "atcore"
  cmake CMakeLists.txt 
  make
}
package(){
  cd "atcore"
  make DESTDIR="$pkgdir/" install 
  mkdir "$pkgdir/usr/bin"
  cp "testclient/AtCoreTest" "$pkgdir/usr/bin/"
}  
