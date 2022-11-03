# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TEQC
_pkgver=4.20.0
pkgname=r-${_pkgname,,}
pkgver=4.20.0
pkgrel=1
pkgdesc='Quality control for target capture experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-hwriter
  r-iranges
  r-rsamtools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2fde8727b6522954a7b2fda4e692fd9991843a7666499cb1c9d85c9eb349e88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
