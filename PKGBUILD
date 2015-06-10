# Maintainer: ianux <ianux@free.fr>

pkgname=stellarium-bzr
_bzrname=stellarium
pkgver=7343
pkgrel=1
pkgdesc="A 3D planetarium software which renders realistic skies in real time"
arch=('i686' 'x86_64')
url="http://stellarium.org/"
license=('GPL2')
conflicts=('stellarium' 'stellarium-svn')
provides=('stellarium')
replaces=('stellarium-svn')
depends=('desktop-file-utils' 'freetype2' 'glu' 'libgl' 'libpng' 'openssl' 'phonon' 'qt5-quick1' 'xdg-utils')
makedepends=('boost' 'bzr' 'cmake' 'mesa' 'mesa-libgl' 'qt5-tools')
source=('bzr+lp:stellarium')
md5sums=('SKIP')
install='stellarium.install'

pkgver() {
  cd $_bzrname
  bzr revno
}

build() {
  cd $_bzrname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $_bzrname
  make DESTDIR="$pkgdir" install
}
