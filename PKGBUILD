# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichplot
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Visualization of Functional Enrichment Result'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aplot
  r-dose
  r-ggnewscale
  r-ggplot2
  r-ggraph
  r-ggtree
  r-gosemsim
  r-igraph
  r-magrittr
  r-plyr
  r-purrr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-scatterpie
  r-shadowtext
  r-yulab.utils
)
optdepends=(
  r-annotationdbi
  r-clusterprofiler
  r-dplyr
  r-europepmc
  r-ggforce
  r-ggplotify
  r-ggrepel
  r-ggridges
  r-ggstar
  r-ggtreeextra
  r-ggupset
  r-grdevices
  r-gridextra
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-scales
  r-tibble
  r-tidydr
  r-tidyr
  r-tidytree
  r-treeio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fc0cff48e40e2314c39e507f093de0921f5598e69760ac5beec3f880aa77583')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
