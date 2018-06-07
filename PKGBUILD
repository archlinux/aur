# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=desc
_cranver=1.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-desc
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Manipulate DESCRIPTION Files"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-assertthat' 'r-crayon' 'r-rprojroot')

optdepends=('r-covr' 'r-testthat' 'r-whoami' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('d885cbcbbe96497662122932253a3475')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

