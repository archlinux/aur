# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Base
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Automated Affymetrix Array Analysis Base Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-a4core
  r-a4preproc
  r-annaffy
  r-biobase
  r-genefilter
  r-glmnet
  r-gplots
  r-limma
  r-mpm
  r-multtest
)
optdepends=(
  r-all
  r-cairo
  r-gridsvg
  r-hgu95av2.db
  r-javagd
  r-nlcv
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2233decf2dd9ff2e8f5808c46cce5e090f3c513b7e40290c529d1dc52f2d3642')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
