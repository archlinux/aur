# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=sundials23
_pkgname=sundials
pkgver=2.3.0
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
provides=('sundials')
conflicts=('sundials')
options=('!libtool')
source=("http://computation.llnl.gov/casc/sundials/download/code/$_pkgname-$pkgver.tar.gz")
md5sums=('c236f2a7e0e6a03b8fab3d189471b933')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure F77=gfortran --prefix=/usr --disable-mpi --with-cflags=-fPIC --enable-shared
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make prefix="$pkgdir/usr" install
}

