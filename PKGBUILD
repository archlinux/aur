# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=combi
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Compositional omics model based visual integration'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-alabama
  r-bb
  r-biobase
  r-cobs
  r-ggplot2
  r-limma
  r-nleqslv
  r-phyloseq
  r-reshape2
  r-summarizedexperiment
  r-tensor
  r-vegan
  r-dbi
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('03cc27cf0fb005e6f49b07541daca1a3cfe810799599ec4ea09164bf0aec9c82')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
