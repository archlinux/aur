# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intervals
_pkgver=0.15.2
pkgname=r-${_pkgname,,}
pkgver=0.15.2
pkgrel=4
pkgdesc='Tools for Working with Points and Intervals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bd23b0ce817ddd851238233d8a5420bf3a6d29e75fd361418cbc50118777c57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
