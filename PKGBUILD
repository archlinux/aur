# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentHubData
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Add resources to ExperimentHub'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhubdata
  r-biocgenerics
  r-biocmanager
  r-curl
  r-dbi
  r-experimenthub
  r-httr
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-genomeinfodb
  r-hubpub
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('161f1dcd5c957028f25a303373e3a8e6a0965c8c319c5f3a896d3165c11ab5a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
