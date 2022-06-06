# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACAAnnotation
_pkgver=0.99.3
pkgname=r-${_pkgname,,}
pkgver=0.99.3
pkgrel=4
pkgdesc='LowMACAAnnotation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('959348611155b78a4b58452230a547af13028b674c06a826e748931259002366')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
