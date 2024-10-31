# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IHW
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Independent Hypothesis Weighting'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-fdrtool
  r-lpsymphony
  r-slam
)
optdepends=(
  r-airway
  r-biocstyle
  r-deseq2
  r-devtools
  r-dplyr
  r-ggplot2
  r-gridextra
  r-knitr
  r-matrix
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c662c3585f935f343ab98656471e39d019b44154215a54bb131eeae4c7e69fb7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
