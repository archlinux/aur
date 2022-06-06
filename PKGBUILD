# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.base
_pkgver=0.0-3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=4
pkgdesc="Core Functionality for the 'rebus' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
)
optdepends=(
  r-stringi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('deeccf9ac75c3b4e8242ff481e9f95895b11fb2178b695ce303329cfbe8653d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
