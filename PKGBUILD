# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coexnet
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=2
pkgdesc='coexnet: An R package to build CO-EXpression NETworks from Microarray Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-acde
  r-affy
  r-biobase
  r-geoquery
  r-igraph
  r-limma
  r-minet
  r-rmarkdown
  r-siggenes
  r-stringdb
  r-summarizedexperiment
  r-vsn
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d309e6ed4c557fbd55a525095a8725717c0483a0e882e75b5bf89433653e74c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
