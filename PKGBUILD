# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="View AnnotationHub and ExperimentHub Resources Interactively"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-dt
  r-experimenthub
  r-htmlwidgets
  r-rclipboard
  r-s4vectors
  r-shiny
  r-shinyace
  r-shinybiocloader
  r-shinyjs
  r-shinythemes
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-curl
  r-glue
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-shinytest2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c5f2b955050974b86959a8c68a07634')
b2sums=('7856c3a418219214408ac5d07d43c16777c37e55c4368b8bdb2ed7c6c5d8fa04455b5ac73cca1ee4dec2ba8718c963f3b7f46e87edfe8f1b419feb69d5184c83')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
