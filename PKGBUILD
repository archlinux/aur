# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rSWeeP
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions to creation of low dimensional comparative matrices of Amino Acid Sequence occurrences"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18cf9743d6a6e6deeb529ba896bf6790')
b2sums=('d39d7c5ec6197379d5e5cf0b3b181c4301677c28a7037d729e9602966218e63408841247fa54ae1852be191376d7bc56705c5885377339785a9b8f798b7eea8c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
