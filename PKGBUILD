pkgname=gppcscconnectionplugin
pkgver=1.2.4
pkgrel=1
pkgdesc="GlobalPlatform pcsc connection plugin"
license=('GPL3')
arch=('i686' 'x86_64')
_commit=d317cc12d29fe8d38275b8c78d53a2b6a77dd07b
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
makedepends=('cmake' 'pkgconf')
md5sums=('f08c4f76b5d670246570dd9e18c6709a')

build() {
  cd globalplatform-$_commit/gppcscconnectionplugin
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gppcscconnectionplugin
  make DESTDIR=$pkgdir install
}
