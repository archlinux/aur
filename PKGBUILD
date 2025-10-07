# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cageminer
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
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
  r-rlang
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c388b6c4414b1913ad83850679d0819db4b5339009b65e1f733528a5bec12685')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
