# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=covr
_cranver=3.5.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Test Coverage for Packages"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.1.0' r-digest r-jsonlite r-rex r-httr r-crayon 'r-withr>=1.0.2' r-yaml)
optdepends=(r-r6 r-curl r-knitr r-rmarkdown r-htmltools r-dt r-testthat r-rlang r-rstudioapi r-xml2 r-memoise r-mockery)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('a54cfc3623ea56084158ac5d7fe33f216f45191f6dcddab9c9ed4ec1d9d8ac6c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
