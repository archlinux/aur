# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=purrr
_cranver=0.3.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functional Programming Tools"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(gpl3)
depends=('r>=3.2' 'r-magrittr>=1.5' 'r-rlang>=0.3.1')
makedepends=(gcc)
optdepends=(r-covr r-crayon r-dplyr r-knitr r-rmarkdown r-testthat r-tibble r-tidyselect)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c8eb681161e566440cae83b36d84704a')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
