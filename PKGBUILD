# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interactiveDisplayBase
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Base package for enabling powerful shiny web displays of Bioconductor objects'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-dt
  r-shiny
)
optdepends=(
  r-knitr
  r-markdown
  r-rstudioapi
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5521f0c45d61861063252625df6828221c909ad8208e3e289c5993f0d0e474dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
