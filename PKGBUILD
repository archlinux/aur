# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cgdsr
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=4
pkgdesc='R-Based API for Accessing the MSKCC Cancer Genomics Data Server (CGDS)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-httr
  r-r.methodss3
  r-r.oo
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4aa2a3564cee2449c3ff39ab2ad631deb165d4c78b8107e0ff77a9095340cc1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
