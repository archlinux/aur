# system requirements: OpenBabel
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMassBank
_pkgver=3.22.0
pkgname=r-${_pkgname,,}
pkgver=3.22.0
pkgrel=1
pkgdesc='Workflow to process tandem MS files and build MassBank records'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  openbabel
  r
  r-assertthat
  r-biobase
  r-chemminer
  r-data.table
  r-digest
  r-dplyr
  r-envipat
  r-glue
  r-httr
  r-httr2
  r-logger
  r-msnbase
  r-mzr
  r-purrr
  r-r.utils
  r-rcdk
  r-rcpp
  r-readjdx
  r-readr
  r-rjson
  r-s4vectors
  r-tibble
  r-tidyselect
  r-webchem
  r-xml
  r-yaml
)
optdepends=(
  r-biocstyle
  r-camera
  r-gplots
  r-knitr
  r-magick
  r-rmarkdown
  r-rmassbankdata
  r-runit
  r-xcms
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('073dec085fd7ece176ae524c54d3a5b7b70950665deb3c19af6b97ab5d3a6044')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
