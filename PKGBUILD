# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=PTMods
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Managing Post-Translational Modifications in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('336dd0e12e4a16f33f8f4c90d0b90892')
b2sums=('bdc843f61df1caeb78819be8f6fd1150ef540234dc2d29e3f43ac6a093bd4f061e0f8e4494037e9d6ec5abcc3297f06ba6b4eb8dc71c8529286b01d327b1f70c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
