# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=rBLAST
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Interface for the Basic Local Alignment Search Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blast+
  r-biocfilecache
  r-biostrings
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f611fdce70d08d341ac895a4cceedf6')
b2sums=('4b74f206621bebd5824c37d1f39a0189331031c63e238e25db939b1e764fc44ac5a4af0685a3e813ef96d8142e4fb39a5c7ad098cd598e77fd6d2404b4a8add1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
