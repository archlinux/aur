# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rSWeeP
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spaced Words Projection (SWeeP)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biostrings
  r-doparallel
  r-foreach
  r-stringi
)
optdepends=(
  r-ape
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rtsne
  r-seurat
  r-testthat
  r-tictoc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b3467fe553240038917d2f8b463fe1a')
b2sums=('a3b93410bc0c434263610e37c9aa868f1b13f705104616cca0247d937324bc2058114ecb50ee564aabba61edf5a9379d4b9ee9b4a102d65ec82f0c3a4128c9e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
