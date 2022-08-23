# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsesvd
_pkgver=0.2-1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc="Sparse Truncated Singular Value Decomposition (from 'SVDLIBC')"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3d03b4d6bfe19c4e108d0ef6e425aa66830190ba4e5b5cccf3ee6eed5abe07b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
