# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=webshot
_cranver=0.5.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Take Screenshots of Web Pages"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.0' r-magrittr r-jsonlite r-callr phantomjs imagemagick graphicsmagick optipng)
optdepends=(r-httpuv r-knitr r-rmarkdown r-shiny)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f183dc970157075b51ac543550a7a48fa3428b9c6838abb72fe987c21982043f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
