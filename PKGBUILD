# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ff
_pkgver=4.5.3
pkgname=r-${_pkgname,,}
pkgver=4.5.3
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
sha256sums=('0a2ef8bcdd47c3134e30ade80d07d078dc18d20e3c658b7ee1d7bda35ab333a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
