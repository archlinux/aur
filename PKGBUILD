# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer
pkgver=1.5.2
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libnotify')
makedepends=('qt5-tools')
optdepends=('flashplugin: needed for Deezer, MixCloud, SoundCloud Music Service')
conflicts=('mellowplayer')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz")
md5sums=('070f4e84111dd5998bf5b30e73e0d43a')
install="mellowplayer.install"

build() {
  cd $srcdir/MellowPlayer-${pkgver}

  qmake-qt5
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
