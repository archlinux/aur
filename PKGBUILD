# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annmap
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Genome annotation and visualisation package pertaining to Affymetrix arrays and NGS analysis.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-dbi
  r-digest
  r-genefilter
  r-genomicranges
  r-iranges
  r-rmysql
  r-rsamtools
)
optdepends=(
  r-gviz
  r-rjson
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3b50189feec150ca90818d32dcd01c8ea27a0e9e3d71744cc42ca8d53d5a343e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
