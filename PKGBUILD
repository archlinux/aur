# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggtree
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=1
pkgdesc='an R package for visualization of tree and annotation data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-aplot
  r-dplyr
  r-ggfun
  r-ggplot2
  r-magrittr
  r-purrr
  r-rlang
  r-scales
  r-tidyr
  r-tidytree
  r-treeio
  r-yulab.utils
)
optdepends=(
  r-emojifont
  r-ggimage
  r-ggplotify
  r-grdevices
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-stats
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('478f1e93699e98d8447e80987faed9a90acc786175f77cb7b881237650a0d737')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
