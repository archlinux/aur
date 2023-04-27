# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecolitk
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=1
pkgdesc='Meta-data and tools for E. coli'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-affy
  r-ecolicdf
  r-ecolileucine
  r-graph
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f3a8f7eedb008427cd439322aae19550bee4c9076898cf011692387187ed323')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
