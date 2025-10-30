# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=siggenes
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc="Multiple Testing using SAM and Efron's Empirical Bayes Approaches"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-multtest
  r-scrime
)
optdepends=(
  r-affy
  r-annotate
  r-genefilter
  r-kernsmooth
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce6943b201bc54f7692909accbf9de9d8f5186f4666bd0a3e113974553f4e5e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
