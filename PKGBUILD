# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSPrep
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Package for Summarizing, Filtering, Imputing, and Normalizing Metabolomics Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-crmn
  r-dplyr
  r-magrittr
  r-missforest
  r-pcamethods
  r-preprocesscore
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-sva
  r-tibble
  r-tidyr
  r-vim
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('11cae88a6c87effa217ae1c1cf6ca12b4ba9df07b3c694b51e6ad6a0b3de76b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
