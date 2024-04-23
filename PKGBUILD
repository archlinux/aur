# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plsVarSel
_pkgver=0.9.11
pkgname=r-${_pkgname,,}
pkgver=0.9.11
pkgrel=1
pkgdesc='Variable Selection in Partial Least Squares'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bdsmatrix
  r-genalg
  r-msqc
  r-mvtnorm
  r-pls
  r-praznik
  r-progress
)
optdepends=(
  r-rmpi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b5a16a5802fc44443ce22ebc5c959088a36f77ce56b2bb0c9e3deac7ce89d49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
