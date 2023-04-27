# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TNBC.CMS
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='TNBC.CMS: Prediction of TNBC Consensus Molecular Subtypes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-forestplot
  r-ggally
  r-ggplot2
  r-ggpubr
  r-gsva
  r-pheatmap
  r-pracma
  r-quadprog
  r-r.utils
  r-rcolorbrewer
  r-summarizedexperiment
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d418367c8014f84944fa764cb81905b72db9338be5827853ba23e3c5ae484e5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
