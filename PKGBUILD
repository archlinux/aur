# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InterMineR
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='R Interface with InterMine-Powered Databases'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-genomicranges
  r-httr
  r-igraph
  r-iranges
  r-rcurl
  r-rjsonio
  r-s4vectors
  r-sqldf
  r-summarizedexperiment
  r-xml
  r-xml2
)
optdepends=(
  r-biocstyle
  r-go.db
  r-gviz
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1066222fef73224cd0e9149841faf10273389eface5406c7923d07b58fdd8e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
