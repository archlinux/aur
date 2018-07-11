# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=2.7.0
pkgname=r-distr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Object Oriented Implementation of Distributions'
arch=('x86_64')
url='https://cran.r-project.org/package=distr'
license=('LGPL3')
depends=('r' 'r-startupmsg' 'r-sfsmisc')
optdepends=('r-distrex' 'r-svunit' 'r-knitr')
replaces=('r-cran-distr')
source=("https://cran.r-project.org/src/contrib/distr_"$_cranver".tar.gz")
md5sums=('cabac9e19e8369ce7a99d028cc332d1d')

build(){
    R CMD INSTALL distr_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership distr "$pkgdir"/usr/lib/R/library
}

