# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.8-3
pkgname=r-xtable
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Export Tables to LaTeX or HTML'
arch=('any')
url='https://cran.r-project.org/package=xtable'
license=('GPL')
depends=('r' )
optdepends=('r-knitr' 'r-spdep' 'r-splm' 'r-sphet' 'r-plm' 'r-zoo')
replaces=('r-cran-xtable')
source=("https://cran.r-project.org/src/contrib/xtable_"$_cranver".tar.gz")
md5sums=('10f7aebbf39e64798c1042b2a57a39a0')

build(){
    R CMD INSTALL xtable_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership xtable "$pkgdir"/usr/lib/R/library
}

