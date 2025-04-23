# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCbiclust
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Massive correlating biclusters for gene expression data and associated methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocparallel
  r-ggally
  r-ggplot2
  r-go.db
  r-org.hs.eg.db
  r-scales
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-devtools
  r-dplyr
  r-gplots
  r-gprofiler
  r-gsva
  r-knitr
  r-mass
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44512c7ab12fd330d4a21d56104120d150400c6afcaaf737094ceefe47e70db6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
