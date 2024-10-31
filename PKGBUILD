# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyILM
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Linear Model of background subtraction and the Langmuir isotherm'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affxparser
  r-affy
  r-biobase
  r-gcrma
)
optdepends=(
  r-affymetrixdatatestfiles
  r-hgfocusprobe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5dec6b54f45c41ce13e035216de2ac957628c01ee23365f31a58ebef8791a674')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
