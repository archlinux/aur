# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nozzle.R1
_pkgver=1.1-1.1
pkgname=r-${_pkgname,,}
pkgver=1.1.1.1
pkgrel=1
pkgdesc='Nozzle Reports'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('777e0fdada4a4d4c590885897a52beb91a5d5a1b8073c471448b3644d9715639')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
