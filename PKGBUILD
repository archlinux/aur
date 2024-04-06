# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HardyWeinberg
_pkgver=1.7.8
pkgname=r-${_pkgname,,}
pkgver=1.7.8
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
sha256sums=('4cf9a3fe5a67c88b403483ca1fa7d007dc0bb12665611dcf50de4bfac5f0adf1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
