# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Contributor: Cory Giles <mail@corygil.es>

pkgname=bedops
pkgver=2.4.42
pkgrel=1
pkgdesc="Highly scalable genomic feature operations. https://doi.org/10.1093/bioinformatics/bts277"
arch=('x86_64')
url="http://github.com/bedops/bedops/"
license=('GPL')
depends=('glibc' 'python' 'tcsh')
makedepends=('gcc' 'make')
md5sums=('bafec615c27871a0e96d312eca4aec45')
source=(https://github.com/bedops/bedops/archive/refs/tags/v${pkgver}.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make install
    mkdir -p "$pkgdir"/usr/bin
    cp -r bin/* $pkgdir/usr/bin
}
