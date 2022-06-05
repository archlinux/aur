# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyILM
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('069375ab0922a73e89940211469ad14f407d389ba0f1a83451cc5ff1e14266e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
