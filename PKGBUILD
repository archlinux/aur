# Maintainer:  <clu@eeviac>

pkgname=cmpfit
pkgver=1.5
pkgrel=1
pkgdesc="A MINPACK-1 Least Squares Fitting Library in C"
url="http://www.physics.wisc.edu/~craigm/idl/cmpfit.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.physics.wisc.edu/~craigm/idl/down/$pkgname-$pkgver.tar.gz)
md5sums=('67b3e6a4b66762908b00abc0919e77be')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
    
  # Install because makefile has no install...
  mkdir -p $pkgdir/usr/lib
  install -Dm644 libmpfit.a $pkgdir/usr/lib

  mkdir -p $pkgdir/usr/include
  install -Dm644 mpfit.h $pkgdir/usr/include
}
