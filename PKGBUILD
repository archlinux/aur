# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=siggenes
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=1.88.0
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
sha256sums=('397384e73b29df8416451eb570d66f4cabf01afb47c9f44ae1c4156b83905933')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
