# Maintainer: Christos Longros <chris.longros@gmail.com>
_cranname=ankiR
_cranver=0.3.0
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
sha256sums=('06f0c400d01e602d62c7316b3db1ac0beca1932cc21c5a146f65cc2c2728b989')

build() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD build .
}

package() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
