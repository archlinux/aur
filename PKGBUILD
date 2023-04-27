# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnhancedVolcano
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Publication-ready volcano plots with enhanced colouring and labeling'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggrepel
)
optdepends=(
  r-airway
  r-biocgenerics
  r-deseq2
  r-ggalt
  r-ggrastr
  r-gridextra
  r-knitr
  r-magrittr
  r-org.hs.eg.db
  r-pasilla
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b863f236a6a0d38a9588d345d8303529fe208f55a1384833807356b7db839ed5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
