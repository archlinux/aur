# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=usethis
_cranver=1.5.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Automate Package and Project Setup"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.2' 'r-clipr>=0.3.0' r-clisymbols r-crayon 'r-curl>=2.7' r-desc 'r-fs>=1.3.0' r-gh 'r-git2r>=0.23' 'r-glue>=1.3.0' r-purrr r-rlang 'r-rprojroot>=1.2' r-rstudioapi r-whisker r-withr r-yaml)
optdepends=(r-covr r-knitr r-magick r-pkgdown r-rmarkdown r-roxygen2 r-spelling r-styler r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('105ca47d3738ffa63f676ce97593a356')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
