# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IgGeneUsage
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Differential gene usage in immune repertoires'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-rcpp
  r-reshape2
  r-rstan
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
sha256sums=('180287eb41cefda87b67df210cfcddcf6e289cf900567dd1a5e6f9689d293523')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
