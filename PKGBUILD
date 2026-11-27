# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TEQC
_pkgver=4.36.0
pkgname=r-${_pkgname,,}
pkgver=4.36.0
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
sha256sums=('3ac054fbd8c0f524cc4ee5ac7ed2e22994a600d9c4b425a42cfb74da0c13f656')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
