# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aggregateBioVar
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Differential Gene Expression Analysis for Multi-subject scRNA-seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-cowplot
  r-deseq2
  r-dplyr
  r-ggplot2
  r-ggtext
  r-knitr
  r-magick
  r-magrittr
  r-pheatmap
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a15bb2537a76364393092f63c31248c4bf56caca9569112a27b5a4fc9608ef59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
