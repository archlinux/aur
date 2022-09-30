# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISOcodes
_pkgver=2022.09.29
pkgname=r-${_pkgname,,}
pkgver=2022.09.29
pkgrel=1
pkgdesc='Selected ISO Codes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bae4fdf661a1c29694f9702240b84c933518ef70e66312cbaddaf35562d4fe5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
