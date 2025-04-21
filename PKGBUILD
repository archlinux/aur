# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SigCheck
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
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
sha256sums=('887a407b16d31040ba6c3b2fcfe9517318ad3a78ce628237be9c0474e67cfec1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
