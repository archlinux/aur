# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=mcmc
_cranver=0.9-5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mcmc
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Markov Chain Monte Carlo"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-xtable' 'r-iso')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('b935c93882c1ea87c90dd7e562fb6ade')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

