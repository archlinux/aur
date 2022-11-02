# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANF
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('32e8272803089fa5c9e99c8ce30f94d460ef1fe97a84ec4842999070fadbdc79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
