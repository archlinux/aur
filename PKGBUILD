# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LRcell
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Differential cell type change analysis using Logistic/linear Regression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationhub
  r-biocparallel
  r-dplyr
  r-experimenthub
  r-ggplot2
  r-ggrepel
  r-magrittr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-lrcelltypemarkers
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b9172fe0ea143566ae11f56f69eafb73ebb43cbca94d5ec8b03f83f8ba01241')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
