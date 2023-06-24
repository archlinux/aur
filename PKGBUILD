# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=usethis
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=2.2.1
pkgrel=1
pkgdesc='Automate Package and Project Setup'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-clipr
  r-crayon
  r-curl
  r-desc
  r-fs
  r-gert
  r-gh
  r-glue
  r-jsonlite
  r-lifecycle
  r-purrr
  r-rappdirs
  r-rlang
  r-rprojroot
  r-rstudioapi
  r-whisker
  r-withr
  r-yaml
)
optdepends=(
  r-covr
  r-knitr
  r-magick
  r-mockr
  r-pkgload
  r-rmarkdown
  r-roxygen2
  r-spelling
  r-styler
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a59e45c5c900ccea3ade08d58eef55425b8d5f3e46e057cfc4fb034fbc127300')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
