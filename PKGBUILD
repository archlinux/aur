# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RITAN
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Rapid Integration of Term Annotation and Network resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-bgeedb
  r-dynamictreecut
  r-ggplot2
  r-gplots
  r-gridextra
  r-gsubfn
  r-hash
  r-igraph
  r-knitr
  r-linkcomm
  r-mcl
  r-plotrix
  r-png
  r-rcolorbrewer
  r-reshape2
  r-ritandata
  r-sqldf
  r-stringdb
  r-genomicfeatures
  r-ensembldb
  r-annotationfilter
  r-ensdb.hsapiens.v86
)
optdepends=(
  r-bgeedb
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f453bbc24aa3dfc1e13cd55e40176e5a59f2600cac8a891c6396f687dbdb7ccb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
