# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustree
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=0.4.4
pkgrel=3
pkgdesc='Visualise Clusterings at Different Resolutions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-dplyr
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-igraph
  r-rlang
  r-tidygraph
  r-viridis
)
optdepends=(
  r-covr
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-seurat
  r-singlecellexperiment
  r-spelling
  r-summarizedexperiment
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7a6100f88c9a6e8d10b253ee227ecf1dc4e84e418eb8da64cd801d2a158b956f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
