# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ZygosityPredictor
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for prediction of zygosity for variants/genes in NGS data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-delayedarray
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-igraph
  r-iranges
  r-knitr
  r-magrittr
  r-purrr
  r-readr
  r-rlang
  r-rsamtools
  r-stringr
  r-tibble
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea68947d05bf3b8ba399155f1fbf4c08')
b2sums=('df777214ec6cb6ed8fcf08463cd84b97cd8c761976ff92240cb1066b1e32289b5592030014bd9a3817cdb20dd0bda33e43957e0bf3689ad028bb953025bada95')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
