# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExiMiR
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='R functions for the normalization of Exiqon miRNA array data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-affyio
  r-biobase
  r-limma
  r-preprocesscore
)
optdepends=(
  r-mirna10cdf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b03094f075e7fbce16cbe3f0ec45e33dbe8038551a5ed941afae8b77e5145c09')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
