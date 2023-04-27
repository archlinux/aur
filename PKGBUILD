# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mCSEAdata
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=1.19.0
pkgrel=1
pkgdesc='Data package for mCSEA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32954a058003e535140d94d8ba967a12459d44c437feb725e90f69a24e35fa5c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
