# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easyreporting
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Helps creating report for improving Reproducible Computational Research'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-rlang
  r-rmarkdown
  r-shiny
)
optdepends=(
  r-biocstyle
  r-distill
  r-edaseq
  r-edger
  r-knitr
  r-limma
  r-readxl
  r-statmod
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7be6ec68eb2e2f5f7e78e19e7a15d81cbe611800a2c50914c5d0e25f8a52efca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
