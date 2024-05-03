# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IONiseR
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='Quality Assessment Tools for Oxford Nanopore MinION data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bit64
  r-dplyr
  r-ggplot2
  r-magrittr
  r-rhdf5
  r-shortread
  r-stringr
  r-tibble
  r-tidyr
  r-xvector
)
optdepends=(
  r-biocstyle
  r-gridextra
  r-knitr
  r-minionsummarydata
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('42a89feb7cd082dd409dd2d7d7b3e96d987f0337b10d80a7d9e0d0a9489c1ac6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
