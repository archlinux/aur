# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=modelr
_cranver=0.1.8
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-modelr
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Modelling Functions that Work with the Pipe"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-broom'  'r-magrittr' 'r-purrr>=0.2.2' 'r-rlang>=0.2.0' 'r-tibble' 'r-tidyr>=0.8.0' 'r-tidyselect' 'r-vctrs')

optdepends=('r-covr' 'r-ggplot2' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sum=('825ba77d95d60cfb94920bec910872ca2ffe7790a44148b2992be2759cb361c4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

