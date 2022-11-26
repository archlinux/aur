# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSPrep
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=3
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
sha256sums=('5adc80d4850e99a8c91f4ab9b38ac7b7f26cf767df3be34572b9f228f6117815')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
