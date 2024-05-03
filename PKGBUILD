# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampleClassifier
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('1fd86b09706222af7b39ace41ef49956f38f075e8a96f3d151031fde4b6c8889')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
