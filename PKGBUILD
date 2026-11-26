# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edgeR
_pkgver=5.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Empirical Analysis of Digital Gene Expression Data in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-limma
  blas
  lapack
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-annotationdbi
  r-biobase
  r-biocstyle
  r-jsonlite
  r-knitr
  r-nanoparquet
  r-org.hs.eg.db
  r-readr
  r-rhdf5
  r-s4vectors
  r-seuratobject
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('68c8bd0c9b7e7ae9a7b4b4aa2377c1c3')
b2sums=('893edc0464e66b34e6939c660a718f69c97d13e9eeee356fb7c8de43e951e5225ef318b035613ec38ea80da854109d15edf31d2176b146dc2a0513734786d543')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
