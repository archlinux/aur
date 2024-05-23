# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.16.1
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
md5sums=('9da8d8ea658c646fe92512fd30e52704')
b2sums=('c3da29c375e344fb994ed8b5786905c80bd48a48c92105018a6355221d7ec67308334995d564c6acee7e19d7e04df50e8c82bcb21c6e24e62c8b039e783cae74')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
