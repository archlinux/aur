# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BicARE
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Biclustering Analysis and Results Exploration'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-gseabase
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0db171b7a31b7fe4b1b2f8c5ab63519618302f324654d576e29ca8020e18fdfc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
