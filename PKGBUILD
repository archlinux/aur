# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecolitk
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Meta-data and tools for E. coli"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affy
  r-ecolicdf
  r-ecolileucine
  r-graph
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44e919aa7acdbd5684b3c747c5afe7bd')
b2sums=('df6df77e642a2fb7a3a986e55c80567dcdb17959b8affbcd434f953d6bf5053b061faf8b507bf6315c6e04510d119a7b67313c47274e8caf401a59c08eecef79')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
