# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixRider
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Obtain total affinity and occupancies for binding site matrices on a given sequence'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-iranges
  r-s4vectors
  r-tfbstools
  r-xvector
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-jaspar2014
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc75416369ad210210b2deb60366bec7d9140bfbbc86acd14baaac99ce273eec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
