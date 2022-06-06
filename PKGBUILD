# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isobar
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Analysis and quantitation of isobarically tagged MSMS proteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biomart
  r-distr
  r-ggplot2
  r-plyr
)
optdepends=(
  r-boot
  r-dbi
  r-gplots
  r-gridextra
  r-hmisc
  r-limma
  r-mass
  r-msnbase
  r-orgmassspecr
  r-rcolorbrewer
  r-rjsonio
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('042feb6f48adef17d6a8ece66f27f1e0886691116851825e29b1e1495aeb18fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
