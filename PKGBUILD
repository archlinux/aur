# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epivizrStandalone
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Run Epiviz Interactive Genomic Data Visualization App within R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-epivizr
  r-epivizrserver
  r-genomeinfodb
  r-genomicfeatures
  r-git2r
  r-s4vectors
)
optdepends=(
  r-biobase
  r-biocstyle
  r-knitr
  r-mus.musculus
  r-organismdbi
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9fac32f0aca8bae0c70fce6acde6b61b4443effb6e4629e36aca61a09e7e3663')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
