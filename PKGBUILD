# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBQN
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
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
  r-rmarkdown
  r-summarizedexperiment
  r-xml2
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('482d24f009217ad9f202f98cc47a812f5c2fc557c1b404db0b3bae73571ff5fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
