# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Pviz
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
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
sha256sums=('d932597d4b1232980dcd795a2e486cb55efb4927da018ad4741cea16ed7350c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
