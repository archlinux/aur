# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=LearnBayes
_pkgver=2.15.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions for Learning Bayesian Inference"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-coda
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57c6224d3ecab1bcfc6a05a3f369b3e8')
b2sums=('2988d2e9356f34d16b9bbddac1b25b68365836d50229e555968d18a491557113eecdf7e225228b056eeacbeb989f32f1a14bd7c582851df32f597205045f03c8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
