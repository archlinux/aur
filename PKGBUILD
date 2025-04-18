# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=microbiome
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('4a9aee5d715334694052471b0b73f1628455e15ece25139e5ae8e5f3241a0551')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
