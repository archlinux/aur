pkgname=gppcscconnectionplugin
pkgver=1.2.4
pkgrel=2
pkgdesc="GlobalPlatform pcsc connection plugin"
license=('GPL3')
arch=('i686' 'x86_64')
_commit=9d89e9fda45286fe66c7ae88a30a950bd5320da8
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
makedepends=('cmake' 'pkgconf')
md5sums=('65e27ac6d315ef1369dfd3d62792a0d0')

build() {
  cd globalplatform-$_commit/gppcscconnectionplugin
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gppcscconnectionplugin
  make DESTDIR=$pkgdir install
}
