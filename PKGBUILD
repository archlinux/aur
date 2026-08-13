# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HardyWeinberg
_pkgver=1.7.9
pkgname=r-${_pkgname,,}
pkgver=1.7.9
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
sha256sums=('6498a9af66530ce245a21cf5d7b425dc75507cdb25750b0e7d12028180e2e98b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
