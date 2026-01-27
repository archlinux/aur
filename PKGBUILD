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
sha256sums=('8d6faff99567bf53d07de241b88443f803819aefaf61685217e5232e45b83362')

build() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD build .
}

package() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
