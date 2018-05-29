# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rematch
_cranver=1.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rematch
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Match Regular Expressions with a Nicer API"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('MIT')
depends=('r' )

optdepends=('r-covr' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5271666295e232931f21499522489dd3')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

