# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MineICA
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Analysis of an ICA decomposition obtained on genomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biomart
  r-colorspace
  r-fastica
  r-foreach
  r-fpc
  r-ggplot2
  r-gostats
  r-graph
  r-gtools
  r-hmisc
  r-igraph
  r-jade
  r-lumi
  r-lumihumanall.db
  r-marray
  r-mclust
  r-plyr
  r-rcolorbrewer
  r-rgraphviz
  r-scales
  r-xtable
)
optdepends=(
  r-biomart
  r-breastcancermainz
  r-breastcancertransbig
  r-breastcancerupp
  r-breastcancervdx
  r-cluster
  r-domc
  r-future
  r-future.apply
  r-gostats
  r-hgu133a.db
  r-igraph
  r-mclust
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a389df5e671c4741fe9ca13fdbce557df9d453dc31596860c13a627b770f26e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
