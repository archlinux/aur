# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FGNet
_pkgver=3.36.0
pkgname=r-${_pkgname,,}
pkgver=3.36.0
pkgrel=1
pkgdesc='Functional Gene Networks derived from biological enrichment analyses'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-hwriter
  r-igraph
  r-plotrix
  r-png
  r-r.utils
  r-rcolorbrewer
  r-reshape2
  r-xml
)
optdepends=(
  r-annotationdbi
  r-biocgenerics
  r-biocmanager
  r-gage
  r-go.db
  r-knitr
  r-org.sc.sgd.db
  r-rcurl
  r-reactome.db
  r-rmarkdown
  r-runit
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17ce061d62aa29e345854d2431aa4e72b63c2fd827c03b1ef29286fc6b2212e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
