# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stabledist
_pkgver=0.7-1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=4
pkgdesc='Stable Distribution Functions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-fbasics
  r-fmstable
  r-matrix
  r-rmpfr
  r-runit
  r-sfsmisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06c5704d3a3c179fa389675c537c39a006867bc6e4f23dd7e406476ed2c88a69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
