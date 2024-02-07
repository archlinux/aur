# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpNet
_pkgver=2.34.1
pkgname=r-${_pkgname,,}
pkgver=2.34.1
pkgrel=1
pkgdesc='Linear Programming Model for Network Inference'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-lpsolve
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8fb89dcbd3c1d2eb43338961a9dc565efaf3a844db853613a7d1c1cdae41eefd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
