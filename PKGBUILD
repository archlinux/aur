# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=tinytex
_cranver=0.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tinytex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Helper Functions to Install and Maintain TeX Live, and Compile LaTeX Documents"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-testit')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('1d6e3909afe3363649bfbc4d30128514')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

