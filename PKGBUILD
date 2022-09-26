# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcdklibs
_pkgver=2.8
pkgname=r-${_pkgname,,}
pkgver=2.8
pkgrel=1
pkgdesc='The CDK Libraries Packaged for R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fccb520abcaff54e157c41573ca279ef31f1440b8dfec13c7d52d5b6b1021949')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
