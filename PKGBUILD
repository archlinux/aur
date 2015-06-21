# Maintainer:  <clu@eeviac>

pkgname=cmpfit
pkgver=1.2
pkgrel=2
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
md5sums=('ea86da19015c4dd456e2a9e3655b1b4d')

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
