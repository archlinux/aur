# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=setRNG
_pkgver=2022.4-1
pkgname=r-${_pkgname,,}
pkgver=2022.4.1
pkgrel=3
pkgdesc='Set (Normal) Random Number Generator and Seed'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('61c06e6bd6b43c295472c6990266fe87ca41e57db04d3460e756a35ef24e0824')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
