# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Pi
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Leveraging Genetic Evidence to Prioritise Drug Targets at the Gene and Pathway Level"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
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
md5sums=('cb989f0e8a3a1ab90a4a319c860ef602')
b2sums=('1686a2a0049e92fbae97bd6b0fa977e3dadfebe5fd30de13d92ac879fbc8f1d1f94c770623e4ff341d522205eb768b689c645ad17982ef414ab33d0b449574fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
