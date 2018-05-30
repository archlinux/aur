# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=selectr
_cranver=0.4-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-selectr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Translate CSS Selectors to XPath Expressions"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('BSD_3_clause + file LICENCE')
depends=('r' 'r-stringr')

optdepends=('r-testthat' 'r-cran-xml' 'r-xml2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('eb6eddd591db658b05a7e1ea40aeaf4c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

