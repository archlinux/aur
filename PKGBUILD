
pkgname=mellowplayer-kde
pkgver=1.5.0
_commit=84af1a0
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop. Packaged specifically for KDE Sc/Plasma 5."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('x86_64')
depends=('kglobalaccel' 'knotifications')
makedepends=('qt5-tools')
optdepends=('flashplugin: needed for Deezer, MixCloud, SoundCloud Music Service')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/tarball/master/MellowPlayer-${pkgver}.tar.gz")
md5sums=('423620354f5534de16fcc0e3f3b4794a')

build() {
  cd $srcdir/ColinDuquesnoy-MellowPlayer-${_commit}

  qmake-qt5  CONFIG+=kde_support
  make 
}

package() {
  cd $srcdir/ColinDuquesnoy-MellowPlayer-${_commit}

  make INSTALL_ROOT=${pkgdir} install
}
