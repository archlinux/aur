# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=htmltools
_cranver=0.3.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-htmltools
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for HTML"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL')
depends=('r' 'r-digest')

optdepends=('r-markdown' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('336419c2143f958862e01ef1bbc9c253')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

