# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISOcodes
_pkgver=2022.01.10
pkgname=r-${_pkgname,,}
pkgver=2022.01.10
pkgrel=4
pkgdesc='Selected ISO Codes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b25ddec624b46f5630c29267bdf4a749cfb9d001ef029fb9ca84dafe56b1c73f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
