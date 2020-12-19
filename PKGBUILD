# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matt Frichtl <frichtlm@gmail.com>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=testthat
_cranver=3.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unit Testing for R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1' r-brio 'r-callr>=3.5.1' 'r-cli>=2.2.0' 'r-crayon>=1.3.4' r-desc r-digest 'r-ellipsis>=0.2.0' r-evaluate r-jsonlite r-lifecycle r-magrittr r-pkgload r-praise r-processx 'r-ps>=1.3.4' 'r-r6>=2.2.0' 'r-rlang>=0.4.9' 'r-waldo>=0.2.1' 'r-withr>=2.3.0')
optdepends=(r-covr r-curl r-diffviewer r-knitr r-mockery r-rmarkdown r-rstudioapi r-shiny r-usethis r-vctrs r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('297fc45c719684f11ddf9dc9088f5528fdf9b44625165543384eaf579f243ad0')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
