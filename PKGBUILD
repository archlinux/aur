# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqLogo
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequence logos for DNA sequence alignments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45a815f2550b2708c3a4335e0a689cae')
b2sums=('916eaae66c0d2df22ecdd8368e4c3281e7c35c6830532eac7c7b5be1d96de5cf38e60c825a8057020d2965fed555fa41d8c8deb0a0155e3ea20262896265f9bb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
