# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALDEx2
_pkgver=1.28.1
pkgname=r-${_pkgname,,}
pkgver=1.28.1
pkgrel=3
pkgdesc='Analysis Of Differential Abundance Taking Sample Variation Into Account'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biocparallel
  r-genomicranges
  r-iranges
  r-multtest
  r-rfast
  r-s4vectors
  r-summarizedexperiment
  r-zcompositions
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('492e774d4e72c86511028420eac13ec3cd49a210849c10e9257f51aa45e9f776')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
