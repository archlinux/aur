# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=shiny
_cranver=1.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Web Application Framework for R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.0.2' 'r-httpuv>=1.5.2' 'r-mime>=0.3' 'r-jsonlite>=0.9.16' r-xtable 'r-digest>=0.6.25' 'r-htmltools>=0.5.0.9001' 'r-r6>=2.0' r-sourcetools 'r-later>=1.0.0' 'r-promises>=1.1.0' r-crayon 'r-rlang>=0.4.9' 'r-fastmap>=1.0.0' r-withr 'r-commonmark>=1.7' 'r-glue>=1.3.2' 'r-bslib>=0.2.2.9002' r-cachem r-ellipsis 'r-lifecycle>=0.2.0')
optdepends=(r-cairo r-testthat r-knitr r-markdown r-rmarkdown r-ggplot2 r-reactlog r-magrittr r-shinytest r-yaml r-future r-dygraphs r-ragg r-showtext r-sass)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('8bd7d76d67d610aabdcc1df7c8f6d0f18dd695ace16af29b60982541d784bb99')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
