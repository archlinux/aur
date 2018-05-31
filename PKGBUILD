# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=distr
_cranver=2.6.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-distr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Object Oriented Implementation of Distributions"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r' 'r-startupmsg' 'r-sfsmisc' 'r-sweavelistingutils')

optdepends=('r-distrex' 'r-svunit')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('3fe0ece8ba4599f8ba867e2aac9485ca')
replaces=('r-cran-distr')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

