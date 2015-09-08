# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer
pkgver=1.5.0
_commit=84af1a0
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
source=("https://github.com/ColinDuquesnoy/MellowPlayer/tarball/master/MellowPlayer-${pkgver}.tar.gz")
md5sums=('423620354f5534de16fcc0e3f3b4794a')

build() {
  cd $srcdir/ColinDuquesnoy-MellowPlayer-${_commit}

  qmake-qt5
  make 
}

package() {
  cd $srcdir/ColinDuquesnoy-MellowPlayer-${_commit}

  make INSTALL_ROOT=${pkgdir} install
}
