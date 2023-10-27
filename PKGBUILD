# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ptairMS
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Pre-processing PTR-TOF-MS Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-bit64
  r-chron
  r-data.table
  r-doparallel
  r-dt
  r-envipat
  r-foreach
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-hmisc
  r-minpack.lm
  r-msnbase
  r-plotly
  r-rcpp
  r-rhdf5
  r-rlang
  r-scales
  r-shiny
  r-shinyscreenshot
  r-signal
)
optdepends=(
  r-biocstyle
  r-knitr
  r-ptairdata
  r-rmarkdown
  r-ropls
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fa231c1c9aa28ac336710e12eed0611a23b0a1ed09e98e38246b61d525f5662')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
