# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoGAPS
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=3.18.0
pkgrel=1
pkgdesc='Coordinated Gene Activity in Pattern Sets'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-bh
  r-biocparallel
  r-gplots
  r-rcolorbrewer
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8adca64f4ef0a77e064488995966527460def9c7119a3b1d9dc3ca68bf558931')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
