# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cycle
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Significance of periodic expression pattern in time-series data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-mfuzz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cbb7e1cd63d9739b73ce27543d497cb221d75e882cc07c5c937e95eebb95124a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
