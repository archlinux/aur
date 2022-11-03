# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=siggenes
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
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
sha256sums=('7bcaf25b8050e72161ef241ba515f74514d31e97dcbfa482519d785334193a3e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
