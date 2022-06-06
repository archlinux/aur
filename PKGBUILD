# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=modeest
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=4
pkgdesc='Mode Estimation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fbasics
  r-stable
  r-stabledist
  r-statip
)
optdepends=(
  r-evd
  r-knitr
  r-mvtnorm
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a949409bf64679d32400d20aa3d53e65a9a20f5bd1a40993b95f81100e0ed20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
