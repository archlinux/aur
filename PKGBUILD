# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBMLR
_pkgver=1.94.0
pkgname=r-${_pkgname,,}
pkgver=1.94.0
pkgrel=1
pkgdesc='SBML-R Interface and Analysis Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-desolve
  r-xml
)
optdepends=(
  r-rsbml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d9cacc90b66c80a56c4202d5a999f1214780be4345fbb7a4dcca7bdd411f7f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
