# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=enrichit
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'C++' Implementations of Functional Enrichment Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-rcpp
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-yulab.utils
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-annotationdbi
  r-biasedurn
  r-clusterprofiler
  r-deseq2
  r-dose
  r-fgsea
  r-gson
  r-jsonlite
  r-qvalue
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4b99f352a49a102049417578d536bf60')
b2sums=('fe0b75fff3e743309ec95010a74c63de1ea6d003221d3d623b0b578c959949ad50f8f2819979be2fbb45b451c682ee61e24be1a3271930400f7a551d7a540d42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
