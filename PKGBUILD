# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial analysis of in situ cytometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biocparallel
  r-classifyr
  r-cli
  r-concaveman
  r-coxme
  r-data.table
  r-dplyr
  r-ggforce
  r-ggh4x
  r-ggnewscale
  r-ggplot2
  r-ggthemes
  r-lifecycle
  r-lmertest
  r-magrittr
  r-pheatmap
  r-rlang
  r-s4vectors
  r-scales
  r-scam
  r-simpleseg
  r-singlecellexperiment
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-imcrtools
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-spatialdatasets
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('224da66c913abdcd63f6749010972079')
b2sums=('2d33ba63febf07d6a39663660d1490624c34a8e05dfa2485e5a2f7c6f8c766116c1f445910d5b0791a5858fcdc197544aff79794762765270d9661140bd1546d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
