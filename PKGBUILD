# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=stringr
_cranver=1.3.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stringr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simple, Consistent Wrappers for Common String Operations"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL2' 'custom')
depends=('r' 'r-glue' 'r-magrittr' 'r-stringi')

optdepends=('r-covr' 'r-htmltools' 'r-htmlwidgets' 'r-knitr' 'r-rmarkdown' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('2b52caf5b5873afaf5e5a48a6513805f')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

