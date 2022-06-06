# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scrime
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=4
pkgdesc='Analysis of High-Dimensional Categorical Data Such as SNP Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-dbi
  r-mass
  r-oligoclasses
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5d97d3e57d8eb30709340fe572746029fd139456d7a955421c4e3aa75d825578')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
