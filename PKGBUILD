# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=usethis
_cranver=2.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Automate Package and Project Setup"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.2' r-cli 'r-clipr>=0.3.0' r-crayon 'r-curl>=2.7' r-desc 'r-fs>=1.3.0' 'r-gert>=1.0.2' 'r-gh>=1.2.0' 'r-glue>=1.3.0' r-jsonlite r-lifecycle r-purrr r-rappdirs 'r-rlang>=0.4.3' 'r-rprojroot>=1.2' r-rstudioapi r-whisker 'r-withr>=2.3.0' r-yaml)
optdepends=(r-covr r-knitr r-magick r-mockr r-rmarkdown r-roxygen2 r-spelling r-styler r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('22aa2b59f36a8701a4648554c7b0e010253bf917a0f431f06efac7d8a6b59854')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
