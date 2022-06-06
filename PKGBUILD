# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FGNet
_pkgver=3.30.0
pkgname=r-${_pkgname,,}
pkgver=3.30.0
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
  r-rgtk2
  r-rmarkdown
  r-runit
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9d9e063a31dcd69bca942f618fc8b4535554ec8a1f0c0730bb8f7fa8e176883')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
