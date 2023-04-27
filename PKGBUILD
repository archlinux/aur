# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTCGA
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='The Cancer Genome Atlas Data Integration'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggthemes
  r-knitr
  r-purrr
  r-rvest
  r-scales
  r-stringi
  r-survminer
  r-viridis
  r-xml
  r-xml2
  r-rcurl
  r-rmarkdown
  r-htmltools
)
optdepends=(
  r-biobase
  r-devtools
  r-genomicranges
  r-iranges
  r-magrittr
  r-pander
  r-rtcga.clinical
  r-rtcga.cnv
  r-rtcga.methylation
  r-rtcga.mirnaseq
  r-rtcga.mrna
  r-rtcga.mutations
  r-rtcga.rnaseq
  r-rtcga.rppa
  r-s4vectors
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('456ccb6d1e1e96938fdc2162270ae5df53aff3f30e24e2130bac8123028eecf8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
