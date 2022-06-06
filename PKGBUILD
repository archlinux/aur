# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TDARACNE
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Network reverse engineering from time course data.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-genkern
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('587911d599007baff0f9156ad01aa1ed4891f5db454b2245944f978095b2d9e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
