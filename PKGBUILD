# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=htmltab
_cranver=0.7.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-htmltab
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Assemble Data Frames from HTML Tables"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-xml' 'r-httr')

optdepends=('r-testthat' 'r-knitr' 'r-tidyr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8cec7e7ba3ecb76e59e7005164639a99')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

