# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcompData
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=1.29.0
pkgrel=1
pkgdesc='Data used in the miRcomp package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e43980f0bc1d8def891f4d6586787d9c97178524a6be089b221a4545a9248041')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
