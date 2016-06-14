# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Category: science
pkgname='barvinok'
pkgver='0.39'
pkgrel=1
pkgdesc='A library for counting the number of integer points in parametric and non-parametric polytopes'
arch=('i686' 'x86_64')
url='http://freecode.com/projects/barvinok'
license=('GPL')
depends=('ntl' 'isl' 'polylib-gmp' 'glpk>4.47')
source=("http://barvinok.gforge.inria.fr/$pkgname-$pkgver.tar.xz")
md5sums=('d0b6165c4e92b253369f92e6e0be23ef')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    env CPPFLAGS="-DNTL_STD_CXX" ./configure --prefix=/usr --with-isl=system --with-polylib=system
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix="$pkgdir"/usr install
}
