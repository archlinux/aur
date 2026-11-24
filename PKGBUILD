# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=frma
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Frozen RMA and Barcode'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-biocgenerics
  r-dbi
  r-oligo
  r-oligoclasses
  r-preprocesscore
)
optdepends=(
  r-frmaexampledata
  r-hgu133afrmavecs
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07ea644c9890c9963e0cb5af29a50c92b047210e599fb1c386e5332f61d3e84b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
