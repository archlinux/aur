# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=DBI
_cranver=1.0.0
pkgname=r-dbi
pkgver=${_cranver}
pkgrel=1
pkgdesc="R Database Interface"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL')
depends=('r>=3.0.0')
optdepends=('r-blob' 'r-covr' 'r-hms' 'r-knitr' 'r-magrittr' 'r-rprojroot' 'r-rmarkdown' 'r-rsqlite' 'r-testthat' 'r-xml2')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('72206e6de9f1a3e783f74446f31bb54c')

build(){
    cd "$srcdir"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "$srcdir"
}

package() {
    cd "$srcdir"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}

