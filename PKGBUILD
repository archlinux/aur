# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPsimSeq
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=3
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
sha256sums=('1f50dd5b883b3740e35aad7da5fd62d86464d6d7b69f8e3272f1ecdf28ee1be6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
