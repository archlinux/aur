# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.0.10
pkgname=r-iterators
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Provides Iterator Construct for R'
arch=('any')
url='https://cran.r-project.org/package=iterators'
license=('Apache')
depends=('r' )
optdepends=('r-runit' 'r-foreach')
source=("https://cran.r-project.org/src/contrib/iterators_"$_cranver".tar.gz")
md5sums=('8935d3e59e998ae3e1f81cea5ad23789')

build(){
    R CMD INSTALL iterators_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership iterators "$pkgdir"/usr/lib/R/library
}

