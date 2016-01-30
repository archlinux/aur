# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer-kde
pkgver=1.5.2
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop. Packaged specifically for KDE Sc/Plasma 5."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('i686' 'x86_64')
depends=('kglobalaccel' 'knotifications')
makedepends=('qt5-tools')
optdepends=('flashplugin: needed for Deezer, MixCloud, SoundCloud Music Service')
conflicts=('mellowplayer')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz")
md5sums=('070f4e84111dd5998bf5b30e73e0d43a')

build() {
  cd $srcdir/MellowPlayer-${pkgver}

  qmake-qt5  CONFIG+=kde_support
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
