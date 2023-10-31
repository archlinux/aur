# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Dino
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Normalization of Single-Cell mRNA Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biocsingular
  r-matrixstats
  r-s4vectors
  r-scran
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggplot2
  r-ggpubr
  r-grid
  r-gridextra
  r-hexbin
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce278f24eade2de93026f784dfabb62eea0adaa860ca596d10f7dcc13354a8df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
