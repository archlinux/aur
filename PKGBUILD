# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SwathXtend
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='SWATH extended library generation and statistical data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-openxlsx
  r-venndiagram
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4fe1af7d1d3a75494066dcf203af22ec46f52958e4470b7d0f7ef0b8080930a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
