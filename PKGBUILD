# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epivizr
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=2.32.0
pkgrel=1
pkgdesc='R Interface to epiviz web app'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bumphunter
  r-epivizrdata
  r-epivizrserver
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-antiprofilesdata
  r-biobase
  r-biocstyle
  r-hgu133plus2.db
  r-knitr
  r-minfi
  r-mus.musculus
  r-rmarkdown
  r-roxygen2
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3217a45762f882999006c05e21a3a3fe444c19cbfaea447f90c5db7180347124')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
