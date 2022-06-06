# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parallelMap
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.1
pkgrel=4
pkgdesc='Unified Interface to Parallelization Back-Ends'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-bbmisc
  r-checkmate
)
optdepends=(
  r-batchjobs
  r-batchtools
  r-data.table
  r-rmpi
  r-rpart
  r-snow
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c108a634a335ed47b0018f532a52b032487e239c5061f939ba32355dfefde7e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
