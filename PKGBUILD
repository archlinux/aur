# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Sconify
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='A toolkit for performing KNN-based statistics for flow and mass cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-flowcore
  r-fnn
  r-ggplot2
  r-magrittr
  r-readr
  r-rtsne
  r-tibble
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('04bca05d851988f278efbd55e93aa494330e2ad412a5c4e38daae370e24a7f1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
