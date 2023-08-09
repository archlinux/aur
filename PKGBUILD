# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LogicReg
_pkgver=1.6.6
pkgname=r-${_pkgname,,}
pkgver=1.6.6
pkgrel=1
pkgdesc='Logic Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94d6aef83e8d1e5f010f29d3f2d1832cb758c152f4715923025d9327f8d7bfa3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
