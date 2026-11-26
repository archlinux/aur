# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XINA
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Multiplexes Isobaric Mass Tagged-based Kinetics Data for Network Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-alluvial
  r-ggplot2
  r-gridextra
  r-igraph
  r-mclust
  r-plyr
  r-stringdb
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f2d4efa7c6139265c87c5f6e11b7ec273025ef03ee12411ef0c648da9be5fe16')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
