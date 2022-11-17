# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spicyR
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=1.10.3
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
sha256sums=('ef79bbfd964119aee0917097aae1a9e575e356005d41daf9a2dfb3d47c39eddf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
