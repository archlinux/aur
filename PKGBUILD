# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doppelgangR
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Identify likely duplicate samples from genomic or meta-data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-digest
  r-impute
  r-mnormt
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-curatedovariandata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('da066972c62f0f58ce92e57c1812abfa476a377cfd19572a7a84877e17330bc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
