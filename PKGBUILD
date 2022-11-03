# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NeuCA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
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
sha256sums=('2860d108680ee53451b48b8c261bd5ed959dc56bfac3f28b0367f5e38500d56c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
