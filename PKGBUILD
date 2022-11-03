# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COSMIC.67
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=1.33.0
pkgrel=1
pkgdesc='COSMIC.67'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dda326dde6033061be745f9ec8e32aea3ed0698874c4cfba448cd3a1f8a50943')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
