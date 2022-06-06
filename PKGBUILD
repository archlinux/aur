# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metap
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=1.8
pkgrel=3
pkgdesc='Meta-Analysis of Significance Values'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mathjaxr
  r-mutoss
  r-rdpack
  r-tfisher
  r-qqconf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee9501a8de8a4c47af1632e6053e42ef53fc4b8bdf0f2759edc4d3eefaf5552b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
