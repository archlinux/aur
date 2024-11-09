# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zellkonverter
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Conversion Between scRNA-seq Objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-basilisk
  r-cli
  r-delayedarray
  r-reticulate
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-anndata
  r-biocfilecache
  r-biocstyle
  r-covr
  r-hdf5array
  r-knitr
  r-pkgload
  r-rhdf5
  r-rmarkdown
  r-scrnaseq
  r-spelling
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb3f769b96dd8357426523154dc6e9eb23ca27d183b8a4d2085811c0e5163ff8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
