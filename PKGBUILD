# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=SweaveListingUtils
_cranver=0.7.7
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-sweavelistingutils
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Sweave Together with TeX listings Package"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r' 'r-startupmsg')

optdepends=('r-distr' 'r-distrex')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('7902aa5d3ec2f40164556242413815ea')
replaces=('r-cran-sweavelistingutils')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

