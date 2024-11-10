# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nullranges
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('0608133aa524aa425527b5eb72f0a5fc0367d7d79421826478c548a5db93614f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
