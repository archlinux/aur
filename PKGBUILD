# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BindingSiteFinder
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Binding site defintion based on iCLIP data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggforce
  r-ggplot2
  r-gviz
  r-matrixstats
  r-plyr
  r-rtracklayer
  r-s4vectors
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-forcats
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e648fc497ecaabd9de283a7f58d773924a7edaa94a02d9c339c19e2c6b8ba998')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
