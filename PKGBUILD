# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenSA
_pkgver=1.1.12
pkgname=r-${_pkgname,,}
pkgver=1.1.12
pkgrel=1
pkgdesc='Generalized Simulated Annealing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('739b6eb5c278b7d203d005c675ac3e37c656388ee55f22546a8030062b04be54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
