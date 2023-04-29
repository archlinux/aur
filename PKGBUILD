# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CAMERA
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
pkgrel=1
pkgdesc='Collection of annotation related methods for mass spectrometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-graph
  r-hmisc
  r-igraph
  r-rbgl
  r-xcms
)
optdepends=(
  r-biocgenerics
  r-faahko
  r-rmpi
  r-runit
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e563eef91afcf735b9fb1d37a82e02005f3e45175c0b00aee234b074a2a57ab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
