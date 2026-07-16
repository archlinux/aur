# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Pviz
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Peptide Annotation and Data Visualization using Gviz'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-biovizbase
  r-data.table
  r-genomicranges
  r-gviz
  r-iranges
)
optdepends=(
  r-knitr
  r-pepdat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c112285f71dd9c3c5d8584bcb43f8071968a84087132c7ec6573bae3b7ece51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
