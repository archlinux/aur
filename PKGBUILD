# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=MCMCpack
_cranver=1.4-3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mcmcpack
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Markov Chain Monte Carlo (MCMC) Package"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-coda' 'r-mcmc' 'r-quantreg')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('6a659ea7647987e5d5c2b57e347e2e76')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

