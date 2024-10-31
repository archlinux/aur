# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.6.0
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
  r-s4vectors
  r-shiny
  r-shinyace
  r-shinyjs
  r-shinythemes
  r-shinytoastr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-shinytest2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7135fde8c3a9a8604e4ba7890a3380c')
b2sums=('208d3b685cd2caac4c9b186ffd9b899517f30a19911cdd7539c039ca2c0b94b7a459e0f0806315e7a536212281fa645a1e66119e8c1b692818573d619a926551')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
