# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nullranges
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=3
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
  r-ensembldb
  r-excluderanges
  r-experimenthub
  r-knitr
  r-magrittr
  r-microbenchmark
  r-nullrangesdata
  r-patchwork
  r-plotgardener
  r-rcpphmm
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44b19975892a0b1d5c90a24edba72874f90adc967a952b40d420be6f53eac705')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
