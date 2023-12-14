# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Peptides
_pkgver=2.4.6
pkgname=r-${_pkgname,,}
pkgver=2.4.6
pkgrel=1
pkgdesc='Calculate Indices and Theoretical Physicochemical Properties of Protein Sequences'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f50b81bde4138ca5348347269b2c305e6b3954e7dd6bc8e48d15f9da985b2ba5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
