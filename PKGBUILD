# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=DT
_cranver=0.11
pkgname=r-dt
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Wrapper of the JavaScript Library 'DataTables'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-htmltools>=0.3.6' 'r-htmlwidgets>=1.3' 'r-jsonlite>=0.9.16' 'r-magrittr' 'r-crosstalk' 'r-promises')
optdepends=('r-knitr' 'r-rmarkdown' 'r-shiny')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7dbaeeee1734aab656e8a46c8be69f0a')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
