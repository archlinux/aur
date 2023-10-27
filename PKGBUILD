# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=frma
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
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
sha256sums=('272d93b320e8293f6d6690926c8968f39cd3b1794e9bbda0e51474a811292d54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
