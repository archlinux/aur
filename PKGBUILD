# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plethy
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='R framework for exploration and analysis of respirometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-dbi
  r-ggplot2
  r-iranges
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rsqlite
  r-s4vectors
  r-streamer
)
optdepends=(
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9b7d06badae7bfee7ee56efd7f7da2f5d78c12eadf9e8ccdf90a0960d4f2225')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
