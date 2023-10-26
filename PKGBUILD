# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="View AnnotationHub and ExperimentHub Resources Interactively"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('bc7ef9bc6285eb045f191b7c72846d68')
sha256sums=('72cab04c7ce6742eec96fadf32449a05cead64506d949b16d19eedbbb73ee2eb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
