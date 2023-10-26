# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TRONCO
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=2.34.0
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
sha256sums=('0c2aaa699415c01628ed9e7f8d1d48c77c8bab21e083ec5dd13698422f878834')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
