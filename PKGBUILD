# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dmt
_pkgver=0.8.20
pkgname=r-${_pkgname,,}
pkgver=0.8.20
pkgrel=6
pkgdesc='Dependency Modeling Toolkit'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc8474b0f8b330d0a33c7bd07037a3aa4b2f5e50c88fa5a98686783113458c67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
