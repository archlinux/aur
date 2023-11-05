# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneAccord
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=3
pkgdesc='Detection of clonally exclusive gene or pathway pairs in a cohort of cancer patients'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('custom')
depends=(
  r
  r-biomart
  r-catools
  r-dplyr
  r-ggplot2
  r-ggpubr
  r-gtools
  r-magrittr
  r-maxlik
  r-rcolorbrewer
  r-reshape2
  r-tibble
)
optdepends=(
  r-assertthat
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a155431556d6560bc661e71284cd762974d11c9ecff10f9c2fdb059a59c396b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
