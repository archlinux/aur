# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Heatplus
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
pkgrel=1
pkgdesc='Heatmaps with row and/or column covariates and colored clusters'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcolorbrewer
)
optdepends=(
  r-biobase
  r-hgu95av2.db
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd716d77425cb3d3724e1172b52e3346ac78cd8e63a3d3a02d57029378112e0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
