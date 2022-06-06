# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBA
_pkgver=0.0-9
pkgname=r-${_pkgname,,}
pkgver=0.0.9
pkgrel=4
pkgdesc='Multilevel B-Spline Approximation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
)
optdepends=(
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf804e42a77c4e33364549fa1ee1da1742244a369a235eda1c79730e67cb751a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
