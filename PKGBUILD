# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.3
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile1.8')
makedepends=('gcc-fortran' 'suitesparse')
optdepends=('h5utils: for visualization and conversion of scientific data')
options=('!libtool' '!makeflags')
source=(http://ab-initio.mit.edu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('18a5b9e18008627a0411087e0bb60db5')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure CC=gcc CXX=g++ --prefix=/usr --enable-shared --with-mpi
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
