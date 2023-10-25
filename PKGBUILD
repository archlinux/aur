# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biobroom
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('ae7a64554a7703208072d6788b1480a732ea30cbf80277ba42ee45e16fa46cc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
