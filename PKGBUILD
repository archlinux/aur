# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.4.0
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
md5sums=('476c4a9e75e1e2c81ef76ba97ae720cc')
b2sums=('26192f9b7ab9e8817f4d3a50a65e7671cb9a616c6164c74b6143c8c0c92b12336332ab2b18087a40171441b9ddfe40c2a5a9ae457c12693b957d04188091045f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
