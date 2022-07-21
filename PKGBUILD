# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Exact
_pkgver=3.1
pkgname=r-${_pkgname,,}
pkgver=3.1
pkgrel=4
pkgdesc='Unconditional Exact Test'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rootsolve
)
optdepends=(
  r-exactdata
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d67f5c71b1209bea655d1e8d7530fa72359e0bcac25312551524501d0287e3cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
