# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggtree
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=3.16.0
pkgrel=1
pkgdesc='an R package for visualization of tree and annotation data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-aplot
  r-cli
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
  r-glue
  r-grdevices
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-shadowtext
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('da3c4f102eeb77558a9e9030c2b04a8966c0cbc9b818965827ee01660cc49b1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
