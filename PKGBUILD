# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggmsa
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc="Plot Multiple Sequence Alignment using 'ggplot2'"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aplot
  r-biostrings
  r-dplyr
  r-ggforce
  r-ggplot2
  r-magrittr
  r-r4rna
  r-rcolorbrewer
  r-seqmagick
  r-tidyr
  r-ggtree
  r-ggfun
)
optdepends=(
  r-ape
  r-cowplot
  r-gggenes
  r-ggnewscale
  r-ggtreeextra
  r-kableextra
  r-knitr
  r-prettydoc
  r-readxl
  r-rmarkdown
  r-statebins
  r-testthat
  r-yulab.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6f55d47cde41e81f19e83c1a6084004fe139f5a8850eb0ab11b29055630d82c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
