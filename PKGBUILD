# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Pi
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Leveraging Genetic Evidence to Prioritise Drug Targets at the Gene and Pathway Level'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-caret
  r-dnet
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggnetwork
  r-ggplot2
  r-ggrepel
  r-glmnet
  r-igraph
  r-iranges
  r-osfr
  r-plot3d
  r-purrr
  r-randomforest
  r-rcircos
  r-readr
  r-rocr
  r-scales
  r-suprahex
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-data.tree
  r-doparallel
  r-fgsea
  r-foreach
  r-ggally
  r-ggbio
  r-ggforce
  r-ggpubr
  r-gridextra
  r-gviz
  r-jsonlite
  r-knitr
  r-png
  r-rcolorbrewer
  r-rmarkdown
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db36fb4222d96ca007a81e8f7031fbc540a77d38f417513ec3a613ad0fbefb6e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
