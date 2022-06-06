# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=howmany
_pkgver=0.3-1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=4
pkgdesc='A lower bound for the number of correct rejections'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee40f4b730f5be864b3d1952b534a901fb2c06bded38ff16d7e239a8309aac10')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
