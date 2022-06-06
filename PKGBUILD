# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nullranges
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
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
  r-ks
  r-plyranges
  r-progress
  r-rlang
  r-s4vectors
  r-scales
  r-speedglm
)
optdepends=(
  r-annotationhub
  r-cobalt
  r-dnacopy
  r-ensdb.hsapiens.v86
  r-excluderanges
  r-knitr
  r-magrittr
  r-microbenchmark
  r-nullrangesdata
  r-patchwork
  r-plotgardener
  r-rcpphmm
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6bb3fa5a675b728d532366542e67fdf7e76dd1c195966efaf8577c887047fd03')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
