# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3Drop
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Michaelis-Menten Modelling of Dropouts in single-cell RNASeq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-gplots
  r-hmisc
  r-irlba
  r-matrixstats
  r-numderiv
  r-rcolorbrewer
  r-reldist
  r-statmod
)
optdepends=(
  r-biobase
  r-knitr
  r-m3dexampledata
  r-monocle
  r-rocr
  r-scater
  r-seurat
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7fde2f66d62efe74b514c50ae584beb7ac4f79e9e67f2783a390c3c3262ac476')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
