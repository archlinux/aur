# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rstan
_cranver=2.17.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rstan
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to Stan"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-ggplot2>=2.0.0' 'r-stanheaders>=2.17.2' 'r-inline' 'r-cran-gridextra>=2.0.0' 'r-bh>=1.65' 'r-stanheaders>=2.17.2')

optdepends=('pandoc' 'r-bh' 'r-loo' 'r-shinystan' 'r-bayesplot' 'r-rstantools' 'r-rstudioapi' 'r-knitr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('942f119d1dd76a915374eb37f54cb9a4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

