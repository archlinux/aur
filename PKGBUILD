# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BindingSiteFinder
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Binding site defintion based on iCLIP data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-complexheatmap
  r-dplyr
  r-forcats
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggdist
  r-ggforce
  r-ggplot2
  r-iranges
  r-kableextra
  r-lifecycle
  r-matrixstats
  r-plyr
  r-rcolorbrewer
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-tibble
  r-tidyr
)
optdepends=(
  r-ashr
  r-biocstyle
  r-deseq2
  r-genomicalignments
  r-ggally
  r-ggplotify
  r-ggpointdensity
  r-ggrastr
  r-gviz
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scales
  r-summarizedexperiment
  r-testthat
  r-viridis
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be996dd54ecce1079d7e2601a419b3639e5cf495e0d0a2500171c9f621c2c4a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
