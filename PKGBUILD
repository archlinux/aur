# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=r-swirl
pkgver=2.4.5
pkgrel=1
pkgdesc='Platform for learning (and teaching) statistics and R simultaneously and interactively'
arch=('any')
url='https://github.com/swirldev/swirl'
license=('GPL')
depends=('r' 'r-digest' 'r-httr' 'r-rcurl' 'r-stringr' 'r-yaml')
makedepends=('r-testthat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=("f532ec56579a87e0c42e6c94ec06c2c515a02ecec347b343916249b808a0f4a48f0bbd881cd4f8e3c54f00fa87b205be722321c76dc8de784cd52de8c1781c44")

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
