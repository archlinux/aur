# system requirements: Java version >= 1.7, Pandoc
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CHRONOS
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='CHRONOS: A time-varying method for microRNA-mediated sub-pathway enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-circlize
  r-doparallel
  r-foreach
  r-graph
  r-igraph
  r-openxlsx
  r-rbgl
  r-rcurl
  r-rjava
  r-xml
  pandoc
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dfd560fffba39c4452518e4b570faca20a2efaa6931ca1146a3c53fb7c02249b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
