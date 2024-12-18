# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tLOH
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Assessment of evidence for LOH in spatial transcriptomics pre-processed data using Bayes factor calculations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bestnormalize
  r-data.table
  r-depmixs4
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-matrixgenerics
  r-naniar
  r-purrr
  r-scales
  r-stringr
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('efb3db7cee730005481affbe3b6212c0f71ba0bcf8ae2fbb7c88d2eb3a9470b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
