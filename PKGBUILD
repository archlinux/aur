# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentHub
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='Client to access ExperimentHub resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-biocfilecache
  r-biocgenerics
  r-biocmanager
  r-rappdirs
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-experimenthubdata
  r-hubpub
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc8c442e81514a0986b40260a970179b8b1777ee2a8e5f4a1024d0f2341134df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
