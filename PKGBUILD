# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miaViz
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Microbiome Analysis Plotting and Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-biocgenerics
  r-biocparallel
  r-delayedarray
  r-dirichletmultinomial
  r-dplyr
  r-ggnewscale
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-ggtree
  r-mia
  r-patchwork
  r-rlang
  r-s4vectors
  r-scales
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidygraph
  r-tidyr
  r-tidytext
  r-tidytree
  r-treesummarizedexperiment
  r-viridis
)
optdepends=(
  r-beeswarm
  r-biocstyle
  r-bluster
  r-circlize
  r-complexheatmap
  r-ggh4x
  r-ggpubr
  r-knitr
  r-maaslin3
  r-mediation
  r-miatime
  r-rmarkdown
  r-rstatix
  r-shadowtext
  r-testthat
  r-vegan
  r-vipor
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('436115872a89a9d973c04e9a78ca42a7ea2912a072b224a03ffea0f142e2e467')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
