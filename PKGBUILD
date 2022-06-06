# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PairedData
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=1.1.1
pkgrel=4
pkgdesc='Paired Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gld
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8e45503734eae1893a50cd0ae60b0a41fcb90f28138a61605d7f1e94873c51f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
