# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lars
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=3
pkgdesc='Least Angle Regression, Lasso and Forward Stagewise'
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
sha256sums=('c69e6a8da6a3344c0915dd1fd4c78fec5cdf50c62cf6297476e9bb7dc10b549d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
