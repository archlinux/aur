# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qtl
_pkgver=1.50
pkgname=r-${_pkgname,,}
pkgver=1.50
pkgrel=4
pkgdesc='Tools for Analyzing QTL Experiments'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d38656f04dc4187aefe56c29a8f915b8c7e222d76b84afe7045d272294f9ed5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
