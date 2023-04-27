# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sesameData
_pkgver=1.17.8
pkgname=r-${_pkgname,,}
pkgver=1.17.8
pkgrel=1
pkgdesc='Supporting Data for SeSAMe Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-experimenthub
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-readr
  r-s4vectors
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-sesame
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3bafe4aee2e5fb673a1277fc5101bc64cd31bd6798744354232fa08bd07b8c8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
