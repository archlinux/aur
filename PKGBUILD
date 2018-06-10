# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=dbplyr
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-dbplyr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A dplyr Back End for Databases"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-assertthat>=0.2.0' 'r-dbi>=0.7' 'r-dplyr>=0.7.4' 'r-glue>=1.2.0' 'r-purrr>=0.2.4' 'r-rlang>=0.1.6' 'r-tibble>=1.4.1' 'r-tidyselect>=0.2.2')

optdepends=('r-bit64' 'r-covr' 'r-knitr' 'r-lahman' 'r-nycflights13' 'r-rmarkdown' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3132707768f771374209ae65fd9055de')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

