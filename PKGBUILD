# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.4-4
pkgname=r-mcmcpack
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Markov Chain Monte Carlo (MCMC) Package'
arch=('x86_64')
url='https://cran.r-project.org/package=MCMCpack'
license=('GPL3')
depends=('r' 'r-coda>=0.11.3' 'r-mcmc' 'r-quantreg')
source=("https://cran.r-project.org/src/contrib/MCMCpack_"$_cranver".tar.gz")
md5sums=('8a456a044b2c3c3748a92c70fcac06ca')

build(){
    R CMD INSTALL MCMCpack_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership MCMCpack "$pkgdir"/usr/lib/R/library
}

