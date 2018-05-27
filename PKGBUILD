# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rstan
_cranver=2.17.3
pkgname=r-rstan
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="User-facing R functions for Stan models"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('GPL3')
depends=('r'
         'r-cran-bh>=1.65'
         'r-rcppeigen>=0.3.3.3.0'
         'r-cran-cpp>=0.12.0'
         'r-cran-gridextra>=2.0.0'
         'r-inline'
         'r-stanheaders>=2.17.2'
         'r-cran-ggplot2>=2.0.0')

optdepends=(
    'r-loo'
    'r-shinystan'
    'r-bayesplot'
    'r-rstantools'
    'r-rstudioapi'
    'r-knitr')

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('942f119d1dd76a915374eb37f54cb9a4')
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd "${srcdir}"
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
