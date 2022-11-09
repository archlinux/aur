# system requirements: Pandoc (>= 1.17.2)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>


_pkgname=bookdown
_pkgver=0.30
pkgname=r-${_pkgname,,}
pkgver=0.30
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
sha256sums=('911c086ec36896fa75532824e14c0716dac6294f428ccaaea18989ddf2d2a4c4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
