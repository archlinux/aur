# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miaViz
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
  r-ggtree
  r-mia
  r-purrr
  r-rlang
  r-s4vectors
  r-scater
  r-summarizedexperiment
  r-tibble
  r-tidygraph
  r-tidyr
  r-tidytree
  r-treesummarizedexperiment
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-microbiomedatasets
  r-patchwork
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('67d2a0f10eeb82986635da62203b2472221c28a263767f280dde7daae339f7a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
