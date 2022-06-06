# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtt
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=0.1.2
pkgrel=4
pkgdesc='Discrete Trigonometric Transforms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6ee86fb571b3ee04ac1d8d04fbc76b12515c09afee688d56a4f39ea63910f59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
