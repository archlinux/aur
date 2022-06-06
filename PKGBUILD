# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBQN
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Mean/Median-balanced quantile normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-ggplot2
  r-limma
  r-paireddata
  r-preprocesscore
  r-rappdirs
  r-rcurl
  r-rpx
  r-summarizedexperiment
  r-xml2
  r-rmarkdown
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e636a6b7975533eeb827b2e107fe5b49fe0340327b8c4db171acb6abb42fb436')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
