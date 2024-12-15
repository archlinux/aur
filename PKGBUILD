# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DRIMSeq
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Differential transcript usage and tuQTL analyses with Dirichlet-multinomial model in RNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-edger
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-reshape2
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-geuvadistranscriptexpr
  r-grid
  r-knitr
  r-pasillatranscriptexpr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc0831f23d1b0a9e08ec35a6415b632f198a17a7a9d428a58b41c0174f84cc2d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
