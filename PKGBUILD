# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BisqueRNA
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Decomposition of Bulk Expression with Single-Cell Sequencing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-limsolve
)
optdepends=(
  r-knitr
  r-plyr
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9226ff04e21bfc97fc707f4e11d8a06')
b2sums=('06cdcb0e54dae68ac5d49d96dbf2182a4c8f23789d4560735bbdef5018e88b199ed139b751fd17414d35d5c27f59cc9230312784a9aab503928418a6f0dc0772')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
