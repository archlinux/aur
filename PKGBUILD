# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellMixS
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Evaluate Cellspecific Mixing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-cowplot
  r-dplyr
  r-ggplot2
  r-ggridges
  r-ksamples
  r-magrittr
  r-purrr
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
  r-tidyr
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-limma
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66a52d3d5ee88746bb4c89fccf7c75aa048e4b78280faee56636ec729b2eb49c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
