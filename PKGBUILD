# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANF
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Affinity Network Fusion for Complex Patient Clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-igraph
  r-rcolorbrewer
)
optdepends=(
  r-experimenthub
  r-knitr
  r-rmarkdown
  r-snftool
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f2d2e24ed1d1809d84f67a65d387382d04f7971315681ec0bfb9faabdaba42b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
