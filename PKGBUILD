# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=2.7-0
pkgname=r-pls
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Partial Least Squares and Principal Component Regression'
arch=('any')
url='https://cran.r-project.org/package=pls'
license=('GPL2')
depends=('r' )
optdepends=('r-rmpi' 'r-testthat' 'r-runit')
source=("https://cran.r-project.org/src/contrib/pls_"$_cranver".tar.gz")
md5sums=('cee00eec5332707f55de26ddee595baa')

build(){
    R CMD INSTALL pls_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership pls "$pkgdir"/usr/lib/R/library
}

