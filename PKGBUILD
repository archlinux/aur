# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=bslib
_cranver=0.2.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Custom 'Bootstrap' 'Sass' Themes for 'shiny' and 'rmarkdown'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r 'r-htmltools>=0.5.1' r-jsonlite 'r-sass>=0.3.0' 'r-digest>=0.6.25' 'r-jquerylib>=0.1.3' r-rlang r-magrittr)
optdepends=(r-shiny r-rmarkdown r-knitr r-testthat r-withr r-rappdirs r-curl)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4c59e1a5519019d65dd4803af632f9b9c24fe23e94dafaf5f4128e8ca9d89762')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
