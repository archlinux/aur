# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=cellranger
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-cellranger
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Translate Spreadsheet Cell Ranges to Rows and Columns"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-rematch' 'r-tibble')

optdepends=('r-covr' 'r-testthat' 'r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('1abcfea6af5ab2e277cb99e86880456f')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

