# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Wrench
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('b7d51b9ed3959f56838b4f32c4f724583970aaf7ef8789042b2a56b303167a84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
