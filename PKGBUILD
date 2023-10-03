# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ExperimentHubData
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
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
sha256sums=('c76643270973ad9656aad32f6bfa9e18f5ed56044d056e79c71cfd0d0b34d764')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
