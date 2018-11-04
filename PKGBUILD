# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.10.1
pkgrel=2
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi')
makedepends=('gcc-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr #--disable-all-plugins
  make -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('dc3770d56215699754f1b0c361c85fb19142328fd07bf05a478edea268ace86d4fc95ca0bc4337ff12c23adcec0c1441ecc40cc42383e8e531a235dca31f8626')
