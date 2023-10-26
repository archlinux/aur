# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExiMiR
_pkgver=2.44.0
pkgname=r-${_pkgname,,}
pkgver=2.44.0
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
sha256sums=('102d61cbd14f0bc6bd7ef8f20821396b56e0d878c74de02a59209521c2e76672')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
