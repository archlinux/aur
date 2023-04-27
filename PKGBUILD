# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowCHIC
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Analyze flow cytometric data using histogram information'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ebimage
  r-flowcore
  r-ggplot2
  r-hexbin
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f3828e1cee66224a3593dbf488f8cf5c9b8656f06b05a63858166fce97e6c7ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
