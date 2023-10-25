# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NOISeq
_pkgver=2.46.0
pkgname=r-${_pkgname,,}
pkgver=2.46.0
pkgrel=1
pkgdesc='Exploratory analysis and differential expression for RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8b17b542bc278546c74a22c31fbd5e174530164b8355565ce5e90e7b08d34063')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
