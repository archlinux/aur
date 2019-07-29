# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranver=0.10
_cranname=rstudioapi
pkgname=r-rstudioapi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Safely Access the RStudio API'
arch=('any')
url='https://cran.r-project.org/package=rstudioapi'
license=('MIT')
depends=('r' )
optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c6ac84330a55f2e3dcffd2ec3f829532')

build(){
    R CMD INSTALL rstudioapi_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rstudioapi "$pkgdir"/usr/lib/R/library
}

