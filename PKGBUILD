# system requirements: OpenBabel
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMassBank
_pkgver=3.12.0
pkgname=r-${_pkgname,,}
pkgver=3.12.0
pkgrel=1
pkgdesc='Workflow to process tandem MS files and build MassBank records'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-assertthat
  r-biobase
  r-digest
  r-envipat
  r-httr
  r-logger
  r-msnbase
  r-mzr
  r-rcdk
  r-rcpp
  r-rcurl
  r-rjson
  r-s4vectors
  r-xml
  r-yaml
  openbabel
  r-readjdx
  r-webchem
  r-chemminer
  r-chemmineob
  r-r.utils
  r-data.table
)
optdepends=(
  r-biocstyle
  r-camera
  r-gplots
  r-knitr
  r-rmarkdown
  r-rmassbankdata
  r-runit
  r-xcms
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a76c9c4f833736a40b2fc5455734cea6a6cf39405b008333068adebf0b49c97d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
