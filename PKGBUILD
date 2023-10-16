# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHubsShiny
_pkgver=1.0.0
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
md5sums=('123a3f285b0653c760cbb5a11fcc84e8')
sha256sums=('c74bc7c843de29bd33e48951a755f31e27759fb7c0d5700bf40a7323a21f6765')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
