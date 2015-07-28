# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=fann
pkgver=2.2.0
pkgrel=2
pkgdesc="Fast artificial neural network library"
url="http://leenissen.dk/fann/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/FANN-$pkgver-Source.zip")
md5sums=('292d914684c9eab1d84eb1f59b0fbf69')

build() {
  cd $srcdir/FANN-${pkgver}-Source
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/FANN-${pkgver}-Source
  make DESTDIR=$pkgdir install
}
