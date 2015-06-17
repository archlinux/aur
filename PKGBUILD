#Maintainer: M0Rf30

pkgname=libmimic-qt-git
pkgver=12.7893d0c
pkgrel=1
pkgdesc="A video encoding/decoding library webcam data of the MSN protocol"
arch=('i686' 'x86_64')
url="http://www.kmess.org/"
license=('GPL')
depends=('qt4')
makedepends=('git' 'cmake' 'automoc4')
source=("libmimic::git://gitorious.org/kmess/libmimic-qt.git")

build() {
  cd libmimic
  msg "Starting make..."
  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
          -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd libmimic
  make DESTDIR=${pkgdir} install
} 

pkgver() {
  cd libmimic
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
