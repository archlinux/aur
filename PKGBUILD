# system requirements: Pandoc (>= 1.17.2)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bookdown
_pkgver=0.29
pkgname=r-${_pkgname,,}
pkgver=0.29
pkgrel=1
pkgdesc='Authoring Books and Technical Documents with R Markdown'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-htmltools
  r-jquerylib
  r-knitr
  r-rmarkdown
  r-tinytex
  r-xfun
  r-yaml
  pandoc
)
optdepends=(
  r-bslib
  r-downlit
  r-htmlwidgets
  r-jsonlite
  r-miniui
  r-rsconnect
  r-rstudioapi
  r-servr
  r-shiny
  r-testit
  r-testthat
  r-tibble
  r-tufte
  r-webshot
  r-withr
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b4e3dc44a5c6574e3d9e19ebe7897d3ddcf6eaffe8214e1d272b545929ff723')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
