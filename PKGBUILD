# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mirTarRnaSeq
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='mirTarRnaSeq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-catools
  r-corrplot
  r-data.table
  r-dplyr
  r-pheatmap
  r-pscl
  r-purrr
  r-r.utils
  r-reshape2
  r-ggplot2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-r.cache
  r-rmarkdown
  r-sponge
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dde3db599f019bc70e3b70d573ef0c9383ab759650e23db55d34e97918828e1e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
