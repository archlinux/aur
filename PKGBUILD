# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: radoslaw.dominiak@gmail.com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=harminv
pkgver=1.4.1
pkgrel=1
pkgdesc="A free program to solve the problem of harmonic inversion"
arch=('i686' 'x86_64')
url="https://github.com/stevengj/harminv"
license=('GPL')
depends=('lapack')
makedepends=('gcc-fortran')
options=('!libtool')
source=("https://github.com/stevengj/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e1b923c508a565f230aac04e3feea23b888b47d8e19b08816a97ee4444233670')

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
