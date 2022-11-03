pkgname=otmorris
pkgver=0.13
pkgrel=1
pkgdesc="Morris sensitivity method module"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('openturns')
makedepends=('cmake' 'swig')
source=("https://github.com/openturns/otmorris/archive/v$pkgver.tar.gz")
sha256sums=('c5bb44446c3a9b41ffe7f7c1d5d62cf2b95435b3759744044622b722c70f783c')

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DUSE_SPHINX=OFF \
        .
  make
}

package() {
  cd otmorris-$pkgver
  make DESTDIR="$pkgdir" install
}

