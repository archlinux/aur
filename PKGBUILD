# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampleClassifier
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('e737bb5c078477ca0f38ba75b756c3c4f6db5ce39825687f7c6e4b074a46e061')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
