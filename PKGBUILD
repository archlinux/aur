# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=usethis
_cranver=2.1.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Automate Package and Project Setup"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.4' 'r-cli>=3.0.1' 'r-clipr>=0.3.0' r-crayon 'r-curl>=2.7' 'r-desc>=1.4.0' 'r-fs>=1.3.0' 'r-gert>=1.4.1' 'r-gh>=1.2.1' 'r-glue>=1.3.0' r-jsonlite 'r-lifecycle>=1.0.0' r-purrr r-rappdirs 'r-rlang>=0.4.10' 'r-rprojroot>=1.2' r-rstudioapi r-whisker 'r-withr>=2.3.0' r-yaml)
optdepends=(r-covr r-knitr r-magick r-mockr r-pkgload r-rmarkdown r-roxygen2 r-spelling r-styler r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7d539e16ecdc1cd45ba1a215d42d8b9c16bc38280ddd27048003dbb37b16f052')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
