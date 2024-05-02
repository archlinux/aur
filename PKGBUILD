# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBioinf
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RBioinf"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('79a28ee85ba6f391ff6d805acc7b57bd')
b2sums=('39ab98459ac76b57480230895ec3f178b11374c2875668f73c6414df0ffabdb112e4dbb65e40a9e437e4da9794d09e0b6e8a2abcee45c223f29bef81c4aad949')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
