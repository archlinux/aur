# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rlabkey
_pkgver=3.4.5
pkgname=r-${_pkgname,,}
pkgver=3.4.5
pkgrel=1
pkgdesc="Data Exchange Between R and 'LabKey' Server"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-httr
  r-jsonlite
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44fa736b1e9c8833274df1f78c46b463955ca2b63ce220174dde0751403871b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
