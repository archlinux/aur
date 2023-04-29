# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SigCheck
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=2.32.0
pkgrel=1
pkgdesc="Check a gene signature's prognostic performance against random signatures, known signatures, and permuted data/metadata"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocparallel
  r-e1071
  r-mlinterfaces
)
optdepends=(
  r-biocstyle
  r-breastcancernki
  r-qusage
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3487182133f3f894c0bc51ebe41fd9509e0095ef1e6e7e22b87a60b2ce3d803c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
