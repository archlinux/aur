# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixRider
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('da357ca7a0c27898d16dff1bae56e4f63239f4b921c9f8c1a41b031644d1c888')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
