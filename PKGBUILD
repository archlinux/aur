# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.16.3
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
  r-data.table
  r-dplyr
  r-ggforce
  r-ggplot2
  r-lmertest
  r-magrittr
  r-pheatmap
  r-rlang
  r-s4vectors
  r-scam
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
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fad9a0093b0e5d7094ebb4029426d77a')
b2sums=('62e79059d899ac2a761ae6618723a38d98ce6f0453aef014a347071b83ab99d6ef4c2539d526281d69c13989186c8a134f255ab13281a15bb976f9e722d7201b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
