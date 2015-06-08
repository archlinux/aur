# Contributor:  VirtualTam
# Maintainer: MCMic <come.bernigaud@laposte.net>

pkgname=qphotobooth-git
pkgver=929f8d6
pkgrel=1
pkgdesc="Photo booth implementation for parties."
arch=('i686' 'x86_64')
url="http://projects.haxx.es/p/qphotobooth/"
license=('BSD')
depends=('opencv' 'qt5-base' 'qt5-sensors' 'qt5-webkit' 'qt5-multimedia')
makedepends=('git' 'cmake')
conflicts=()
provides=('qphotobooth')
replaces=('qphotobooth')
_gitname="qphotobooth"
source=(git://haxx.es/qphotobooth.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

build(){
  cd ${_gitname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd ${_gitname}/
  make install DESTDIR=$pkgdir
}
