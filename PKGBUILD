# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetSearch
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='A package for the analysis of GC-MS metabolite profiling data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-ncdf4
)
optdepends=(
  r-biocstyle
  r-knitr
  r-targetsearchdata
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e53c6c0a931ac986792d4b421b295eda4f04fc29a5ab3421f11027e4c13bbd4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
