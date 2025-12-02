# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNORfuzzy
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Addon to CellNOptR: Fuzzy Logic'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cellnoptr
  r-nloptr
)
optdepends=(
  r-biocgenerics
  r-rgraphviz
  r-runit
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8bea74d04542e286ac03ab283d30cec5650bcecc40b2378189e8885e33518d39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
