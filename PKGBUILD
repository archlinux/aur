# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=modelr
_cranver=0.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-modelr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Modelling Functions that Work with the Pipe"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-broom' 'r-dplyr' 'r-magrittr' 'r-purrr' 'r-tibble' 'r-tidyr' 'r-rlang')

optdepends=('r-covr' 'r-ggplot2' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('bc73689405b0fe90851c7f8f3539e843')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

