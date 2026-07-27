# system requirements: Java (>= 8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RWeka
_pkgver=0.4-50
pkgname=r-${_pkgname,,}
pkgver=0.4.50
pkgrel=1
pkgdesc='R/Weka Interface'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rjava
  r-rwekajars
)
optdepends=(
  r-e1071
  r-mlbench
  r-partykit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7bd239460f37f8d7e088771076e9a7b480ca70c4ad01b3d778b7d3ca65808c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
