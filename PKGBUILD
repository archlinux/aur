# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaNeighbor
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Single cell replicability analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-beanplot
  r-dplyr
  r-ggplot2
  r-gplots
  r-igraph
  r-matrixstats
  r-rcolorbrewer
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d008cd559babec4c204ef9865bee1a450f49c86c6d5111ebc887c80659a1679')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
