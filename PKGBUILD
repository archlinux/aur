# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rprojroot
_cranver=1.3-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rprojroot
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Finding Files in Project Subdirectories"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-backports')

optdepends=('r-testthat' 'r-mockr' 'r-knitr' 'r-withr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('030a1d238d41ee1e5e21e55eba8403b2')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

