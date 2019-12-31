# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=DBI
_cranver=1.1.0
pkgname=r-dbi
pkgver=${_cranver}
pkgrel=1
pkgdesc="R Database Interface"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL-2.1' 'LGPL-3')
depends=('r>=3.0.0')
optdepends=('r-blob' 'r-covr' 'r-hms' 'r-knitr' 'r-magrittr' 'r-rprojroot' 'r-rmarkdown' 'r-rsqlite' 'r-testthat' 'r-xml2')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('fa91ce2c8d7bf62a75f858d2501d6d3a')

build(){
    cd "$srcdir"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "$srcdir"
}

package() {
    cd "$srcdir"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}

