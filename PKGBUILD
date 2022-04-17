# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Contributor: Cory Giles <mail@corygil.es>

pkgname=bedops
pkgver=2.4.40
pkgrel=1
pkgdesc="Highly scalable genomic feature operations."
arch=('x86_64')
url="http://github.com/bedops/bedops/"
license=('GPL')
depends=('glibc' 'python' 'tcsh')
makedepends=('gcc' 'make')
md5sums=('84c756bc92a023863ab564b96ba11067')
source=(https://github.com/bedops/bedops/archive/refs/tags/v${pkgver}.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make install
    mkdir -p "$pkgdir"/usr/bin
    cp -r bin/* $pkgdir/usr/
}
