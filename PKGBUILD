# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneStructureTools
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Tools for spliced gene structure manipulation and analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-bsgenome.mmusculus.ucsc.mm10
  r-data.table
  r-genomicranges
  r-gviz
  r-iranges
  r-plyr
  r-rtracklayer
  r-s4vectors
  r-stringdist
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c4b8bfbb15ddc18b1e28886f32c0c6153818034c46832b2c98d9bf8dbc3c34e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
