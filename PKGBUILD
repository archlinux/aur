# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=bslib
_cranver=0.2.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Custom 'Bootstrap' 'Sass' Themes for 'shiny' and 'rmarkdown'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.10' 'r-htmltools>=0.5.1' r-jsonlite 'r-sass>=0.4.0' 'r-digest>=0.6.25' 'r-jquerylib>=0.1.3' r-rlang r-magrittr)
optdepends=(r-shiny r-rmarkdown r-thematic r-knitr r-testthat r-withr r-rappdirs r-curl)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ddfc197b47facbb3e4d4fbb77589150772ae04cfba3d1096053f97c99bfeb28c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
