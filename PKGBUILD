# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biobroom
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Turn Bioconductor objects into tidy data frames'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-broom
  r-dplyr
  r-tidyr
)
optdepends=(
  r-airway
  r-data.table
  r-deseq2
  r-edger
  r-genomicranges
  r-ggplot2
  r-knitr
  r-limma
  r-magrittr
  r-msnbase
  r-plyr
  r-qvalue
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c7af0e8ba9ad4f96c38ace15db59dd47f7bfc7ca3cef12337c19ceca9164858d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
