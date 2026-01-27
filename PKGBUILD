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
sha256sums=('6bfb71f58b43cc476cca9e84d38c7ef488ca799769e56282461d2cc4c939f9b8')

build() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD build .
}

package() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
