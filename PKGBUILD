# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=2.17.4
pkgname=r-rstan
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='R Interface to Stan'
arch=('x86_64')
url='https://cran.r-project.org/package=rstan'
license=('GPL3')
depends=('r' 'r-ggplot2>=2.0.0' 'r-stanheaders>=2.17.2' 'r-inline' 'r-gridextra>=2.0.0' 'r-rcpp>=0.12.0' 'r-rcppeigen>=0.3.3.3.0' 'r-bh>=1.65')
optdepends=('pandoc' 'r-runit' 'r-rcppeigen' 'r-bh' 'r-loo' 'r-shinystan' 'r-bayesplot' 'r-rstantools' 'r-rstudioapi' 'r-knitr')
source=("https://cran.r-project.org/src/contrib/rstan_"$_cranver".tar.gz")
md5sums=('f76498305af16b0a899092f9d03c09d1')

build(){
    R CMD INSTALL rstan_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rstan "$pkgdir"/usr/lib/R/library
}

