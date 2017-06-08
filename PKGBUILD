# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer
pkgver=2.2.4
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg' 'snorenotify')
makedepends=('qt5-tools')
optdepends=('pepper-flash: needed for Deezer and Spotify')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz")
install="mellowplayer.install"
md5sums=('5a45705d739cd4e828f3a187ea3457b9')

build() {
  cd $srcdir/MellowPlayer-${pkgver}
  mkdir build
  cd build

  qmake-qt5 ..
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}/build

  make INSTALL_ROOT=${pkgdir} install
}
