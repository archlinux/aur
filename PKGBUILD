# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=DBI
_cranver=1.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-dbi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Database Interface"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('LGPL')
depends=('r' )

optdepends=('r-blob' 'r-covr' 'r-hms' 'r-knitr' 'r-magrittr' 'r-rprojroot' 'r-rmarkdown' 'r-testthat' 'r-xml2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('72206e6de9f1a3e783f74446f31bb54c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

