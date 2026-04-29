# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=devtools
_pkgver=2.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='Tools to Make Developing R Packages Easier'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-cli
  r-desc
  r-ellipsis
  r-fs
  r-lifecycle
  r-memoise
  r-miniui
  r-pak
  r-pkgbuild
  r-pkgdown
  r-pkgload
  r-profvis
  r-rcmdcheck
  r-rlang
  r-roxygen2
  r-rversions
  r-sessioninfo
  r-testthat
  r-urlchecker
  r-withr
  r-usethis
)
optdepends=(
  r-biocmanager
  r-callr
  r-covr
  r-curl
  r-digest
  r-dt
  r-foghorn
  r-gh
  r-knitr
  r-lintr
  r-rmarkdown
  r-rstudioapi
  r-spelling
  r-httr2
  r-quarto
  r-remotes
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aabda91d6dccd446803641f390ce9fc3')
b2sums=('82011ca0dc35d9322b2224afd14e14fe28bb6b08ac03506c00023048cf306359fa445f0af61db5b68ff3deb7dcc1281c11ff429c495bfcfbd021166423719878')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
