# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yarn
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='YARN: Robust Multi-Condition RNA-Seq Preprocessing and Normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biomart
  r-downloader
  r-edger
  r-gplots
  r-limma
  r-matrixstats
  r-preprocesscore
  r-quantro
  r-rcolorbrewer
  r-readr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('59b4bac0b1aaf53e7ed67941f44f753292b7676dbee28644461903250fa50b6b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
