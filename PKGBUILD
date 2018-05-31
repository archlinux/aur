# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=msm
_cranver=1.6.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-msm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Multi-State Markov and Hidden Markov Models in Continuous Time"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL')
depends=('r' 'r-cran-mvtnorm' 'r-cran-expm')

optdepends=('r-mstate' 'r-minqa' 'r-doparallel' 'r-foreach' 'r-numderiv' 'r-testthat' 'r-flexsurv')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('cf7a6b34d842efe616a4611ec4236496')
replaces=('r-cran-msm')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

