# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPsimSeq
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Semi-parametric simulation tool for bulk and single-cell RNA sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-edger
  r-fitdistrplus
  r-hmisc
  r-limma
  r-mvtnorm
  r-phyloseq
  r-singlecellexperiment
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-knitr
  r-lsd
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5c7830a33b567716dff3ff55e3fb826de424f8ee13017bd5990e2d26146647c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
