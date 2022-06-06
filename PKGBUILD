# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SMVar
_pkgver=1.3.4
pkgname=r-${_pkgname,,}
pkgver=1.3.4
pkgrel=3
pkgdesc='Structural Model for variances'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aaea3ef7da6cee1bb86fef166df766229c8b7cac9fcf5bc28da7adff5e2c01d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
