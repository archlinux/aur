# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ff
_pkgver=4.0.9
pkgname=r-${_pkgname,,}
pkgver=4.0.9
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
sha256sums=('722053271987a0c9673c3ff9e7968bbab47979d529a2fe6bb1a3179408ee3c4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
