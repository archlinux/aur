# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ringo
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
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
sha256sums=('a99348d1239d73a78441e1041c23e4afd8276b4d8d5a501bd83069093691df35')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
