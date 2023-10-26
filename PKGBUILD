# system requirements: C++ software package Random Jungle
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PAA
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='PAA (Protein Array Analyzer)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-e1071
  r-gplots
  r-gtools
  r-limma
  r-mrmre
  r-randomforest
  r-rcpp
  r-rocr
  r-sva
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2000b7af80f2550756668074c8ebd503bb423d9f94f5a69b8e802c3ef9bdb49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
