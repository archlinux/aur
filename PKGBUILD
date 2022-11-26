# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IgGeneUsage
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=3
pkgdesc='Differential gene usage in immune repertoires'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-bh
  r-rcpp
  r-rcppeigen
  r-rcppparallel
  r-reshape2
  r-rstan
  r-rstantools
  r-stanheaders
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eaef9ee318f6d401e8526fc55793ba726d30c1d4de12fff90583483e2733f2af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
