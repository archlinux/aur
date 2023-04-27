# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Wrench
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Wrench normalization for sparse count data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-limma
  r-locfit
  r-matrixstats
)
optdepends=(
  r-deseq2
  r-edger
  r-knitr
  r-metagenomeseq
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('503c078d569e37fa9b3e7a43f83f7e3ff736b16cd5b9895c050d8954d210a1a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
