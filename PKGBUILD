# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HardyWeinberg
_pkgver=1.7.5
pkgname=r-${_pkgname,,}
pkgver=1.7.5
pkgrel=1
pkgdesc='Statistical Tests and Graphics for Hardy-Weinberg Equilibrium'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mice
  r-rcpp
  r-rsolnp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cfd8ac4aaf0a315c77f4ad62f1fe3751707ed0e97b0aade61a4c379000ff7a2c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
