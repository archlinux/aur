# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doSNOW
_pkgver=1.0.20
pkgname=r-${_pkgname,,}
pkgver=1.0.20
pkgrel=4
pkgdesc="Foreach Parallel Adaptor for the 'snow' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-foreach
  r-iterators
  r-snow
)
optdepends=(
  r-caret
  r-compiler
  r-mlbench
  r-parallel
  r-rpart
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('917cabed166aa2d1ec291691c17e1e3d344e858543e1682e3a442cc0c504bbb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
