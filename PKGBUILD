# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Trendy
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Breakpoint analysis of time-course expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-dt
  r-gplots
  r-magrittr
  r-s4vectors
  r-segmented
  r-shiny
  r-shinyfiles
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4bf806a9542764e6d857412998ac42a26f769437797be673f853b18c1555c072')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
