# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=quarto
_cranver=1.5.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Convert R Markdown documents and 'Jupyter' notebooks to a variety of output formats using 'Quarto'."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-cli
    r-fs
    r-htmltools
    r-jsonlite
    r-later
    r-lifecycle
    r-processx
    r-rmarkdown
    r-rstudioapi
    r-xfun
    r-yaml
)
makedepends=()
optdepends=(
    r-bslib
    r-callr
    r-curl
    r-dplyr
    r-flextable
    r-ggiraph
    r-ggplot2
    r-gt
    r-heatmaply
    r-kabelextra
    r-knitr
    r-palmerpenguins
    r-patchwork
    r-pkgload
    r-plotly
    r-rsconnect
    r-testthat
    r-thematic
    r-tidyverse
    r-tinytable
    r-whoami
    r-withr
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4c79dbcffc1786c660c9c5acb55ba1e63bcc59aeece14451acf96635c9673920')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
