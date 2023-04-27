# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AIMS
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='AIMS : Absolute Assignment of Breast Cancer Intrinsic Molecular Subtype'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-e1071
)
optdepends=(
  r-biocgenerics
  r-breastcancervdx
  r-hgu133a.db
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('782039f8c56b13824256f6c421dac737619e5025496b6610e863cdebc1d97cd5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
