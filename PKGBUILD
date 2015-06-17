#Maintainer: M0Rf30

pkgname=libisf-qt-git
pkgver=151.e4c356a
pkgrel=1
pkgdesc="A library to encode and decode handwriting data in MS Ink Serialized Format (ISF)"
arch=('i686' 'x86_64')
url="http://www.kmess.org/"
license=('GPL')
depends=('qt4')
makedepends=('git' 'cmake' 'automoc4')
source=("libisf::git://gitorious.org/kmess/libisf-qt.git")

build() {
  cd libisf
  msg "Starting make..."
  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
          -DCMAKE_BUILD_TYPE=Release 
  make
}

package() {
  cd libisf
  make DESTDIR=${pkgdir} install
} 

pkgver() {
  cd libisf
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
