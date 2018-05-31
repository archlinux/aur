# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=processx
_cranver=3.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-processx
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Execute and Control System Processes"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('MIT')
depends=('r' 'r-assertthat' 'r-crayon' 'r-testthat')

optdepends=('r-covr' 'r-debugme' 'r-testthat' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('6eee8b45e34a79f9cef84d0d45926ca2')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

