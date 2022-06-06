# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=objectProperties
_pkgver=0.6.8
pkgname=r-${_pkgname,,}
pkgver=0.6.8
pkgrel=1
pkgdesc='A Factory of Self-Describing Properties'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-objectsignals
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dfa97111f348862a3174356e1d4fb18d3614215129c9b7ffc8da60c0c5ed2b0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
