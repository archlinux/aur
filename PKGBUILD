# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MMDiff2
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Statistical Testing for ChIP-Seq data sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biostrings
  r-bsgenome
  r-genomicranges
  r-ggplot2
  r-locfit
  r-rcolorbrewer
  r-rsamtools
  r-s4vectors
  r-shiny
)
optdepends=(
  r-biocstyle
  r-bsgenome.mmusculus.ucsc.mm9
  r-knitr
  r-mmdiffbamsubset
  r-motifdb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('97f094290325d53204734c0a1e7ac682216e55a9abd0e2d5b36cae4fb1b01883')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
