# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rlabkey
_pkgver=3.3.0
pkgname=r-${_pkgname,,}
pkgver=3.3.0
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
sha256sums=('1e3f0ed3e1989fa8f5a24927b994c0d69879173f6f626cfaab0a7481c7b75905')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
