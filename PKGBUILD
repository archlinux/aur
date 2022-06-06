# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mltools
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=0.3.5
pkgrel=4
pkgdesc='Machine Learning Tools'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7093ffceccdf5d4c3f045d8c8143deaa8ab79935cc6d5463973ffc7d3812bb10')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
