# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=shiny
_cranver=1.3.2
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'RStudio' Addin for Editing a 'data.frame'"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-httpuv' 'r-mime' 'r-jsonlite' 'r-xtable' 'r-digest' 'r-htmltools' 'r-r6' 'r-sourcetools' 'r-later' 'r-promises' 'r-crayon' 'r-rlang')
optdepends=('r-cairo' 'r-rmarkdown' 'r-testthat' 'r-knitr' 'r-markdown' 'r-ggplot2' 'r-reactlog' 'r-magrittr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('4f88cd99f29758f330db4915f44849ec')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
