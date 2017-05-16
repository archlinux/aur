# Maintainer: Michał Sidor (Michcioperz) <packager@meekchopp.es>
pkgname=mprz
pkgver=0.3.0
pkgrel=1
pkgdesc="random library"
arch=('i686' 'x86_64')
url="https://github.com/michcioperz/libmprz"
license=('LGPL')
source=(git+https://github.com/michcioperz/libmprz.git#tag=v0.3.0)
sha256sums=('SKIP')

build() {
  cd $srcdir/libmprz
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/libmprz
  make DESTDIR=$pkgdir install
}
