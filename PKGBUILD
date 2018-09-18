# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.2.1
pkgname=r-reprex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Prepare Reproducible Example Code via the Clipboard'
arch=('any')
url='https://cran.r-project.org/package=reprex'
license=('MIT')
depends=('r' 'r-callr>=2.0.0' 'r-clipr>=0.4.0' 'r-fs' 'r-rlang' 'r-rmarkdown' 'r-whisker' 'r-withr')
optdepends=('pandoc' 'r-covr' 'r-devtools' 'r-fortunes' 'r-knitr' 'r-miniui' 'r-rprojroot' 'r-rstudioapi' 'r-shiny' 'r-styler' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/reprex_"$_cranver".tar.gz")
md5sums=('c0afa805a5f5b7350d637463edff517e')

build(){
    R CMD INSTALL reprex_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership reprex "$pkgdir"/usr/lib/R/library
}

