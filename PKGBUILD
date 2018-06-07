# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rio
_cranver=0.5.10
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rio
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Swiss-Army Knife for Data I/O"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-haven' 'r-curl' 'r-data.table' 'r-readxl' 'r-openxlsx' 'r-tibble')

optdepends=('r-bit64' 'r-testthat' 'r-knitr' 'r-magrittr' 'r-clipr' 'r-csvy' 'r-feather' 'r-fst' 'r-jsonlite' 'r-readods' 'r-readr' 'r-rmatio' 'r-xml2' 'r-yaml')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c2578de45fdd19e68802e53aea937c7a')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

