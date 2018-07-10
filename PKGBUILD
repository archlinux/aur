# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=clipper
pkgver=2.1.20180526
_url=http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/
pkgrel=1
pkgdesc="A set of object-oriented libraries for the organisation of crystallographic data"
arch=('i686' 'x86_64')
url="http://www.ysbl.york.ac.uk/~cowtan/clipper/clipper.html"
license=('LGPL')
makedepends=('gcc-fortran')
depends=('libccp4' 'mmdb2' 'fftw2-float' 'libssm')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)

sha256sums=('7b77d5c79078eb0ce94ea503c0346c799c44a2872dfd14b09abc404025003c4b')

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
