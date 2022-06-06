# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsesvd
_pkgver=0.2
pkgname=r-${_pkgname,,}
pkgver=0.2
pkgrel=4
pkgdesc="Sparse Truncated Singular Value Decomposition (from 'SVDLIBC')"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a1f54d6b0dca6ae83e3f729a1895c91c58bfe55427dacc50ddb0d2c5d32a9f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
