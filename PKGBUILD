# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpidermiR
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='SpidermiR: An R/Bioconductor package for integrative network analysis with miRNA data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-gdata
  r-httr
  r-igraph
  r-mirnatap
  r-mirnatap.db
  r-org.hs.eg.db
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d3071428cfb05fe9e035fcb51eb27546e1abc4381a9943ae21c6a855810441f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
