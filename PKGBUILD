# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.light
_pkgver=3.40.0
pkgname=r-${_pkgname,,}
pkgver=3.40.0
pkgrel=1
pkgdesc='Light-Weight Methods for Normalization and Visualization of Microarray Data using Only Basic R Data Types'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-matrixstats
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-princurve
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('48f3458ce7e17da222ad08ca248803eb0cdca4bed69a42ec5086f815a1e828cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
