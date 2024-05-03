# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nullranges
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Generation of null ranges via bootstrapping or covariate matching'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggridges
  r-interactionset
  r-iranges
  r-plyranges
  r-progress
  r-rlang
  r-s4vectors
  r-scales
)
optdepends=(
  r-annotationhub
  r-bsgenome.hsapiens.ucsc.hg38
  r-cobalt
  r-diagrammer
  r-dnacopy
  r-dplyr
  r-ensdb.hsapiens.v86
  r-ensembldb
  r-excluderanges
  r-experimenthub
  r-knitr
  r-ks
  r-magrittr
  r-nullrangesdata
  r-patchwork
  r-plotgardener
  r-purrr
  r-rcpphmm
  r-rmarkdown
  r-testthat
  r-tidyr
  r-tidysummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5cbb2e68d847495152d5d0560028fcc3d88812b3b2d7b3d3b8d3162531564028')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
