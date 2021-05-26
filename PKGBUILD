# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=selectr
_cranver=0.4-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-selectr
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Translate CSS Selectors to XPath Expressions"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD_3_clause + file LICENCE')
depends=('r>=3.0' 'r-stringr' 'r-r6')

optdepends=('r-testthat' 'r-xml' 'r-xml2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sums=('5588aed05f3f5ee63c0d29953ef53da5dac7afccfdd04b7b22ef24e1e3b0c127')
build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

