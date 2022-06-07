# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=predictionet
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=4
pkgdesc='Inference for predictive networks designed for (but not limited to) genomic data'
arch=('x86_64')
url="https://bioconductor.org/packages/3.14/bioc/html/predictionet.html"
license=('Artistic2.0')
depends=(
  r
  r-catnet
  r-igraph
  r-penalized
  r-rbgl
)
optdepends=(
  r-knitr
  r-minet
  r-network
)
source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f0e5e55bc1851924820f5733e161e3c0cef35b1e22e90545af4953eb18856fb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
