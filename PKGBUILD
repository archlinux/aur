# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rjags
_cranver=4-6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rjags
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Bayesian Graphical Models using MCMC"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL (== 2)')
depends=('r' 'jags>=4.0.0' 'r-coda')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c26b7cc8e8ddcdb55e14cba28df39f4c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

