# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idr
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=4
pkgdesc='Irreproducible discovery rate'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8bbfdf82c8c2b5c73eb079127e198b6cb65c437bb36729f502c7bcd6037fdb16')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
