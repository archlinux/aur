# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyILM
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
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
sha256sums=('27225620a8377c851479fa3a88f9293446022e12ebf8ea00fed3ac21a43169d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
