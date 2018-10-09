# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=4-7
pkgname=r-rjags
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Bayesian Graphical Models using MCMC'
arch=('x86_64')
url='https://cran.r-project.org/package=rjags'
license=('GPL (== 2)')
depends=('r' 'jags>=4.0.0' 'r-coda>=0.13')
source=("https://cran.r-project.org/src/contrib/rjags_"$_cranver".tar.gz")
md5sums=('9111549bf81f4a0dbb11908d23230197')

build(){
    R CMD INSTALL rjags_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rjags "$pkgdir"/usr/lib/R/library
}

