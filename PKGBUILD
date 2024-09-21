# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ff
_pkgver=4.5.0
pkgname=r-${_pkgname,,}
pkgver=4.5.0
pkgrel=1
pkgdesc='Memory-Efficient Storage of Large Data on Disk and Fast Access Functions'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bit
)
optdepends=(
  r-biglm
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2aed9052a93ca81af4c8cc7defce0f7aa0206b442b4795b6219f6e56b341188e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
