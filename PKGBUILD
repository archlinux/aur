# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=shiny
_cranver=1.4.0
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Web Application Framework for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.0.2' 'r-httpuv>=1.5.2' 'r-mime>=0.3' 'r-jsonlite>=0.9.16' 'r-xtable' 'r-digest' 'r-htmltools>=0.4.0' 'r-r6>=2.0' 'r-sourcetools' 'r-later>=1.0.0' 'r-promises>=1.1.0' 'r-crayon' 'r-rlang>=0.4.0' 'r-fastmap>=1.0.0')
optdepends=('r-cairo' 'r-testthat' 'r-knitr' 'r-markdown' 'r-rmarkdown' 'r-ggplot2' 'r-reactlog' 'r-magrittr' 'r-yaml')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('89acec799bb23da271a7770b84283844')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
