# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IONiseR
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
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
sha256sums=('0bc77b379adc11414319b1cf04e303735b474097b1d9962af7fdd389202065c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
