# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatMA
_pkgver=0.3.15
pkgname=r-${_pkgname,,}
pkgver=0.3.15
pkgrel=3
pkgdesc='Tools to Deal with Raster Maps'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sp
)
optdepends=(
  r-maptools
  r-mass
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8cc5030b056ded8dd26d323065b9b934d5f947d6be7fd8921e9d8003f26d31c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
