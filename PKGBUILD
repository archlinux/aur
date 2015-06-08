# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: radoslaw.dominiak@gmail.com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=harminv
pkgver=1.3.1
pkgrel=3
pkgdesc="A free program to solve the problem of harmonic inversion"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Harminv"
license=('GPL')
depends=('lapack')
makedepends=('gcc-fortran')
options=('!libtool')
source=(http://ab-initio.mit.edu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d3f49f1c90856b3b2e8b77dc4a99c37a')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure \
    F77="gfortran" \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-shared
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make \
    prefix="$pkgdir"/usr \
    mandir="$pkgdir"/usr/share/man \
    install 
}
