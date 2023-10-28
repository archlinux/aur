# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellTrails
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Reconstruction, visualization and analysis of branching trajectories'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-cba
  r-dendextend
  r-dtw
  r-envstats
  r-ggplot2
  r-ggrepel
  r-igraph
  r-maptree
  r-reshape2
  r-rtsne
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-destiny
  r-knitr
  r-org.mm.eg.db
  r-rmarkdown
  r-runit
  r-scater
  r-scran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5c6bba11190daf11fe4a6667d4877e3c1aeb55250a421996ac2d636d77e58dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
