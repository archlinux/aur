# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qtl
_pkgver=1.60
pkgname=r-${_pkgname,,}
pkgver=1.60
pkgrel=1
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
sha256sums=('8e9e5dfe2c6a76d4f69fb27add93ed0859ed3eaa23347310c2b9e3f07359d8ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
