# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=webshot
_cranver=0.5.2
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Take Screenshots of Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r>=3.0' 'r-magrittr' 'r-jsonlite' 'r-callr' 'phantomjs' 'imagemagick' 'graphicsmagick' 'optipng')
optdepends=('r-httpuv' 'r-knitr' 'r-markdown' 'r-shiny')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('a7ea6a307cb98e49c6e65ed8b8a608ab')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
