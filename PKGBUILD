# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellmigRation
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Track Cells, Analyze Cell Trajectories and Compute Migration Statistics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-factominer
  r-fme
  r-foreach
  r-hmisc
  r-matrixstats
  r-reshape2
  r-sp
  r-spatialtools
  r-tiff
  r-vioplot
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-dplyr
  r-ggplot2
  r-kableextra
  r-knitr
  r-rgl
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('95ed98dbe3a561397a434f6304d3fc40d1ec270f4e449ddc10d7c9152ce3ea50')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
