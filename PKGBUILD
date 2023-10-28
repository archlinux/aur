# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=microbiome
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Microbiome Analytics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-compositions
  r-dplyr
  r-ggplot2
  r-phyloseq
  r-reshape2
  r-rtsne
  r-scales
  r-tibble
  r-tidyr
  r-vegan
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-cairo
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05b8dc9433b64cf7dfec1eb8b35352df58bde841bbe39fe5a5dc26b48fe3b376')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
