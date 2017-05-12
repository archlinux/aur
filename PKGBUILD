# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Category: science
pkgname='barvinok'
pkgver='0.40'
pkgrel=1
pkgdesc='A library for counting the number of integer points in parametric and non-parametric polytopes'
arch=('i686' 'x86_64')
url='http://freecode.com/projects/barvinok'
license=('GPL')
depends=('ntl' 'isl' 'polylib-gmp')
source=("http://barvinok.gforge.inria.fr/$pkgname-$pkgver.tar.xz")
md5sums=('a5c0b48b4e336ee652e6e517d14ea9b6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-shared-barvinok --with-isl=system --with-polylib=system
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
