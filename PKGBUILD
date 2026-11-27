# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.14.0
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
md5sums=('74b460b18cdf732dda22112c55aa9ece')
b2sums=('a1cd9f4236317093214cc316ae97d1250c319aeb99895e2c622c1e016c6d35073373fd9a58f859bf602ec0bc1f54be39e3846daacc5d83527cb1233f8f7cb100')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
