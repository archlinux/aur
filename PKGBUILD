# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=clipper
pkgver=2.1.20170202
_pkgver=2.1-20170202
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
pkgrel=2
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4' 'mmdb2' 'fftw2-float' 'libssm')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$_pkgver.tar.gz)

sha256sums=('4d31628272c44fac7df3926f64fab00b76cd08c1c90a187f27d26d8f32325bb4')

build() {
  cd "$srcdir/$pkgname"

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
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
} 
