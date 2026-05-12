# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SmoothWin
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
pkgdesc='Soft Windowing on Linear Regression'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rfast
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4322e1a416f38f9bee55a661217af967d01578eed814d4a92630f104736bf502')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
