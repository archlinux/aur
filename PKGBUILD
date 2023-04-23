# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwrEWAS
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=2
pkgdesc='A user-friendly tool for comprehensive power estimation for epigenome wide association studies (EWAS)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-abind
  r-biocmanager
  r-cpgassoc
  r-doparallel
  r-dosnow
  r-foreach
  r-genefilter
  r-ggplot2
  r-limma
  r-pwrewas.data
  r-shiny
  r-shinybs
  r-shinywidgets
  r-truncnorm
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f392582708f753f8c50bd5b4937b4c6735c86a0b36fdf0668bcb7605a8b713f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
