# Maintainer: Christos Longros <chris.longros@gmail.com>
_cranname=ankiR
_cranver=0.5.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read Anki Flashcard Databases with FSRS-6 Support"
arch=('any')
url="https://github.com/chrislongros/ankiR"
license=('MIT')
depends=(r r-jsonlite r-dbi r-rsqlite r-tibble)
optdepends=(
  'r-testthat: testing'
  'r-knitr: vignettes'
  'r-rmarkdown: vignettes'
)
source=("${_cranname}-${_cranver}.tar.gz::https://github.com/chrislongros/ankiR/archive/refs/tags/v${_cranver}.tar.gz")
sha256sums=('9d1cc9a9bf92e71ec4842b5d8378cfa8a59c0625b1942bb2227570ead131ea7d')

build() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD build .
}

package() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
