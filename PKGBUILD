# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TRONCO
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
pkgrel=1
pkgdesc='TRONCO, an R package for TRanslational ONCOlogy'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bnlearn
  r-circlize
  r-doparallel
  r-foreach
  r-gridextra
  r-gtable
  r-gtools
  r-igraph
  r-iterators
  r-r.matlab
  r-rcolorbrewer
  r-rgraphviz
  r-scales
  r-xtable
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-magick
  r-rwikipathways
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ec48c466e52813196b6843b0b4ffb8e3065083c7c5c469c6426f3ada5e791b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
