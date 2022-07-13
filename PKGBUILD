# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Contributor: Cory Giles <mail@corygil.es>

pkgname=bedops
pkgver=2.4.41
pkgrel=1
pkgdesc="Highly scalable genomic feature operations."
arch=('x86_64')
url="http://github.com/bedops/bedops/"
license=('GPL')
depends=('glibc' 'python' 'tcsh')
makedepends=('gcc' 'make')
md5sums=('f0eadfce409de35ea804c9df993d5d07')
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
