# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: radoslaw.dominiak@gmail.com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=harminv
pkgver=1.4.2
pkgrel=1
pkgdesc="A free program to solve the problem of harmonic inversion"
arch=('i686' 'x86_64')
url="https://github.com/NanoComp/harminv"
license=('GPL')
depends=('lapack')
makedepends=('gcc-fortran')
options=('!libtool')
source=("https://github.com/NanoComp/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5a9a1bf710972442f065d0d62c62d0c4ec3da4a3696d7160a35602c9470bc7a2')

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
