# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ringo
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='R Investigation of ChIP-chip Oligoarrays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-genefilter
  r-limma
  r-rcolorbrewer
  r-vsn
)
optdepends=(
  r-mclust
  r-rtracklayer
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ec7e0b3897400f8137b33d01d3f8c0842991c1ac273ea17ea9518617eeefd5fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
