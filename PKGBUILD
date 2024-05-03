# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RadioGx
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Analysis of Large-Scale Radio-Genomic Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-catools
  r-coregx
  r-data.table
  r-downloader
  r-magicaxis
  r-matrixstats
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-pander
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eef44fae6399a755e71f6f7a0b6b231796d6f092b23ed73aee063a442a2c7c7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
