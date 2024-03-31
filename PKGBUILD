# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HardyWeinberg
_pkgver=1.7.7
pkgname=r-${_pkgname,,}
pkgver=1.7.7
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
sha256sums=('d072d3d3a5fd88e1d84bec109a8381507019e98f030f1f05cb728b38c8720b15')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
