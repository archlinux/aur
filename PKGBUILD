# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=manipulateWidget
_cranver=0.10.0
pkgname=r-manipulatewidget
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Add Even More Interactivity to Interactive Charts"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-shiny' 'r-miniui' 'r-htmltools' 'r-htmlwidgets' 'r-knitr' 'r-base64enc' 'r-webshot')
optdepends=('r-dygraphs' 'r-leaflet' 'r-plotly' 'r-xts' 'r-rmarkdown' 'r-testthat' 'r-covr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('6599fa2b8e3881a1699a569fc918879d')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}

