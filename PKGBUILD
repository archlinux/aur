# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampleClassifier
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Sample Classifier'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotate
  r-e1071
  r-ggplot2
  r-mgfm
  r-mgfr
)
optdepends=(
  r-biocstyle
  r-hgu133a.db
  r-hgu133plus2.db
  r-sampleclassifierdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('549888b8db06c70e6bd22c961bfe0297863397fd928ff0ee9c9594c6f97d95a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
