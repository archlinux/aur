# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miloR
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='Differential neighbourhood abundance testing on a graph'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-cowplot
  r-dplyr
  r-edger
  r-ggbeeswarm
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-gtools
  r-igraph
  r-irlba
  r-limma
  r-matrixstats
  r-patchwork
  r-rcolorbrewer
  r-s4vectors
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-curl
  r-graphics
  r-knitr
  r-magick
  r-mass
  r-mousegastrulationdata
  r-mousethymusageing
  r-mvtnorm
  r-rcurl
  r-rmarkdown
  r-scater
  r-scran
  r-scuttle
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b191d1dade79e6aef03014432bc62c024876ab25db759c55d63d4eacd2107a1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
