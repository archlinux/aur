# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rstan
_cranver=2.17.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rstan
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to Stan"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL3')
depends=('r' 'r-ggplot2' 'r-stanheaders' 'r-inline' 'r-cran-gridextra' 'r-bh' 'r-stanheaders')

optdepends=('r-bh' 'r-loo' 'r-shinystan' 'r-bayesplot' 'r-rstantools' 'r-rstudioapi' 'r-knitr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('942f119d1dd76a915374eb37f54cb9a4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

