# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Mfuzz
_pkgver=2.68.0
pkgname=r-${_pkgname,,}
pkgver=2.68.0
pkgrel=1
pkgdesc='Soft clustering of time series gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-e1071
  r-tkwidgets
)
optdepends=(
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bbe7b71256adb8fbdff48b53e574c5a1e1a62db1f9d9ea1a05590ab5f0738218')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
