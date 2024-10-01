# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rapiclient
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=0.1.8
pkgrel=1
pkgdesc='Dynamic OpenAPI/Swagger Client'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-httr
  r-jsonlite
  r-yaml
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ced6376de92f2d99bde91c94d87dd6e8fe76ee09e6cd4b0c87b48f5379b9faa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
