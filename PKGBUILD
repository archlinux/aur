# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cageminer
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=1.2.5
pkgrel=1
pkgdesc='Candidate Gene Miner'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bionero
  r-genomeinfodb
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-ggtext
  r-iranges
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('317460a09ff8664b25a119c49d63932c5996b2ff328e5c5b63fa974359c209ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
