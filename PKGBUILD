# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWAS.BAYES
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='GWAS for Selfing Species'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-doparallel
  r-ga
  r-ggplot2
  r-memoise
  r-rcpp
  r-rcppeigen
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-qqman
  r-rmarkdown
  r-rrblup
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8cf40e0c89357008d63d4336e5c119e29ec41e3ad175847991ab8eafc50c88c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
