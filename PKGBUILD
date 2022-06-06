# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoGene
_pkgver=1.0-24
pkgname=r-${_pkgname,,}
pkgver=1.0.24
pkgrel=3
pkgdesc='Order-Restricted Inference for Microarray Experiments'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-ff
  r-iso
  r-xtable
  tk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('19049382c45c870cd8e51e47ec1ec9b38bbfa1ff4af31fd5a07b5af57505953a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
