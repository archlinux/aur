# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NeuCA
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='NEUral network-based single-Cell Annotation tool'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-e1071
  r-keras
  r-limma
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-networkd3
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a822ae97630b91ef64a02d32cecfd0eb62fd30e1741bde51c791c24ebab6b05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
