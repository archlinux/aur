# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial analysis of in situ cytometry data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
depends=(
  r-biocgenerics
  r-biocparallel
  r-classifyr
  r-concaveman
  r-data.table
  r-dplyr
  r-ggforce
  r-ggplot2
  r-iranges
  r-lmertest
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36cba4820e1206ad3a7220e0430b245f')
sha256sums=('29e3a8bad60bd1165ac6bea4a4d9a05bfaf3c5308034c678a9478b1a5491e462')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
