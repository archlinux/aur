# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNViz
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Copy Number Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-copynumberplots
  r-dplyr
  r-dt
  r-genomicranges
  r-karyoploter
  r-magrittr
  r-plotly
  r-scales
  r-shiny
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ab6730e19ed9dc39488e4fb8f1446e4168413efd45bde77e1794b2aebddaa73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
