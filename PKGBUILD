# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matrix.utils
_pkgver=0.9.8
pkgname=r-${_pkgname,,}
pkgver=0.9.8
pkgrel=6
pkgdesc='Data.frame-Like Operations on Sparse and Dense Matrix Objects'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-grr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ebc59d3ef751775515586ff1f2396e429a1e9d91a10099d804134fcf74c0ae28')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
