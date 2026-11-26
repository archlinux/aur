# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BRAIN
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='Baffling Recursive Algorithm for Isotope distributioN calculations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-polynomf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8cd7ab868108107b5423ee954df8d611957a9efde4026f68a7edebed0d704766')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
