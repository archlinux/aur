# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mcbiopi
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=1.1.6
pkgrel=4
pkgdesc='Matrix Computation Based Identification of Prime Implicants'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('271541d1d79a96caad01b7534886a799587894b6dcfab600ff82c312bc165cb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
