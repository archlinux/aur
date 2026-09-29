# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=drc
_pkgver=4.0-0
pkgname=r-${_pkgname,,}
pkgver=4.0.0
pkgrel=1
pkgdesc='Analysis of Dose-Response Curves'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-gtools
  r-multcomp
  r-plotrix
  r-scales
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4fec25ca2d44dbb69259051a18c7323def632976e78998eb950f1e93c23a552b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
