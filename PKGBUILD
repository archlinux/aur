# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=clipper
pkgver=2.1.20180802
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
pkgrel=2
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4>=6.5.1-6' 'mmdb2>=2.0.19-1' 'fftw2-float' 'libssm')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)

sha256sums=('7c7774f224b59458e0faa104d209da906c129523fa737e81eb3b99ec772b81e0')

build() {
  cd "$srcdir/$pkgname-2.1"

  ./configure --prefix=/usr \
              --enable-shared \
              --disable-static \
              --enable-contrib \
              --enable-ccp4 \
              --enable-cif \
              --enable-mmdb \
              --enable-minimol \
              --enable-cns \
              --enable-phs \
              --enable-fortran
  make
}

package() {
  cd "$srcdir/$pkgname-2.1"

  make DESTDIR="$pkgdir/" install
}
