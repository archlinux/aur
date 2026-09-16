# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=r-swirl
pkgver=2.4.5
pkgrel=2
pkgdesc='Platform for learning (and teaching) statistics and R simultaneously and interactively'
arch=('any')
url='https://github.com/swirldev/swirl'
license=('GPL')
depends=('r' 'r-digest' 'r-httr' 'r-rcurl' 'r-stringr' 'r-yaml')
makedepends=('r-testthat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4cf04eeb4e704ede76d03a9a3b2b8e57822d0081edea5296197161d08b376e53982bac966fac569c77672057bea24de7a39fb0bd7e1d4f7b89c84c88799f2d42')

build(){
    R CMD INSTALL $pkgname-$pkgver.tar.gz -l "$srcdir"
}

#check(){
#    R CMD BATCH tests/test-all.R
#}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership swirl "$pkgdir"/usr/lib/R/library
}
