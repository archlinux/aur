# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lasso2
_pkgver=1.2-22
pkgname=r-${_pkgname,,}
pkgver=1.2.22
pkgrel=4
pkgdesc="L1 Constrained Estimation aka lasso"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b2eb62a680592923b91393985e461b6ecd15a3929515b2e21a4a651a06c07d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
