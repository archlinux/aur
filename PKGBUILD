# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwrEWAS
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
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
sha256sums=('ceceb9b05d6b8c27e0569bec8b59fbbe263f1ffd526887dbc34164f3b14ecbf5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
