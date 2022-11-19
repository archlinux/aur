# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.10.4
pkgname=r-${_pkgname,,}
pkgver=1.10.4
pkgrel=1
pkgdesc='Spatial analysis of in situ cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-concaveman
  r-data.table
  r-dplyr
  r-ggforce
  r-ggplot2
  r-iranges
  r-lme4
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
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pkgdown
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ada562e38893adf1428f49566cce840d37ebaca573c1d4b197ca96f54aa7ec8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
