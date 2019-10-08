# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyr
_cranver=1.0.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An evolution of 'reshape2'. It's designed specifically for data tidying (not general reshaping or aggregating) and works well with 'dplyr' data pipelines."
url="https://cran.r-project.org/package=tidyr"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-dplyr>=0.8.2' 'r-ellipsis>=0.1.0' 'r-glue' 'r-magrittr' 'r-purrr' 'r-rcpp' 'r-rlang' 'r-stringi' 'r-tibble>=2.1.1' 'r-tidyselect>=0.2.5' 'r-vctrs>=0.2.0' 'r-lifecycle')
optdepends=('r-covr' 'r-jsonlite' 'r-knitr' 'r-repurrrsive' 'r-readr' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('aa176afd716bc7c3243d4988f0fc8c03') 

build() {
    cd ${srcdir}
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
