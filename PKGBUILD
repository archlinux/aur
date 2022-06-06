# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MMDiff2
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('02ed5a0a377e8e070f987d13f2ea3825404070c07051a79a2a1267d3841c2d0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
