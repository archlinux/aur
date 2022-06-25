# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zellkonverter
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=1.6.3
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
  r-biocfilecache
  r-biocstyle
  r-covr
  r-hdf5array
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-scrnaseq
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ffb7cbc2c8ebf71d54499d0f36ef6874c446d320bfa0ba0717f876ff853adb50')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
