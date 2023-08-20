# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hash
_pkgver=2.2.6.3
pkgname=r-${_pkgname,,}
pkgver=2.2.6.3
pkgrel=1
pkgdesc='Full Feature Implementation of Hash/Associated Arrays/Dictionaries'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a030b5be9c6494b44af9d8cd7a966cc94a41ae0aaecb553fc36de4762749110')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
