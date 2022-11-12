# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proFIA
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=1
pkgdesc='Preprocessing of FIA-HRMS data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CeCILL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-minpack.lm
  r-missforest
  r-pracma
  r-ropls
  r-xcms
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-plasfia
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('723bb21f11cfa9366f8ec1a229290f3383b621495d72d9df6e85b80088dc0878')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
