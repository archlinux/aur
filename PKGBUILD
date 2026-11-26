# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BUSseq
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Batch Effect Correction with Unknow Subtypes for scRNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-gplots
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0cb60a4202f659894f8d051d897f025e3864475426d305565b88bd666f393d6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
