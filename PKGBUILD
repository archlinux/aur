# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RnaSeqSampleSize
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='RnaSeqSampleSize'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-dplyr
  r-edger
  r-ggplot2
  r-ggpubr
  r-heatmap3
  r-keggrest
  r-matlab
  r-rcpp
  r-recount
  r-rnaseqsamplesizedata
  r-summarizedexperiment
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca36a479674a6ac41a5c23d6e71fc5933ed11216ddc8219157a19b08c90139e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
