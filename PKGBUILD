# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gsettings-qt-bzr
_bzrname=gsettings-qt
pkgver=0.1.r69
pkgrel=1
pkgdesc="Qml bindings for GSettings."
arch=('i686' 'x86_64')
url="https://launchpad.net/gsettings-qt"
makedepends=('bzr')
depends=('qt5-base' 'qt5-declarative')
provides=('gsettings-qt')
license=('GPL')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~system-settings-touch/$_bzrname/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $_bzrname
  printf "0.1.r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir"/$_bzrname
  qmake gsettings-qt.pro
  make
}

package() {
  cd "$srcdir"/$_bzrname
  make INSTALL_ROOT="$pkgdir" install
}

