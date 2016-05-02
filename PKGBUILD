# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer
pkgver=2.0.1
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-webengine' 'snorenotify')
makedepends=('qt5-tools')
optdepends=('chromium-pepper-flash-standalone: needed for Deezer and Spotify')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz")
install="mellowplayer.install"
md5sums=('d06a7703ce682020bf66e059376f63dc')

build() {
  cd $srcdir/MellowPlayer-${pkgver}

  qmake-qt5
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
