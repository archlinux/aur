# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HIBAG
_pkgver=1.34.1
pkgname=r-${_pkgname,,}
pkgver=1.34.1
pkgrel=1
pkgdesc='HLA Genotype Imputation with Attribute Bagging'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcppparallel
  gcc
  make
)
optdepends=(
  r-gdsfmt
  r-ggplot2
  r-knitr
  r-markdown
  r-parallel
  r-reshape2
  r-rmarkdown
  r-seqarray
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d9aa8d74a0a1866641f9cea2b7eae63d536ee5f79da0355a8efb18f4d42f8db')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
