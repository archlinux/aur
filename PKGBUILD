# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellity
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Quality Control for Single-Cell RNA-seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-e1071
  r-ggplot2
  r-mvoutlier
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-robustbase
  r-topgo
)
optdepends=(
  r-biocstyle
  r-caret
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76e454d59896a79cdc2d2ab9cd1d5422ea06a0e6bbb0910a2662ef2c58c0e954')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
