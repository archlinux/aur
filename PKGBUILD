# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doppelgangR
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=1.27.0
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
sha256sums=('b01c8e628251d2a51762a7a8db30ef72704d2bc154487f52458e77ecf18f72a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
