# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEE
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Signal-to-Noise applied to Gene Expression Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-snageedata
)
optdepends=(
  r-all
  r-hgu95av2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('faadcab23b170f71a29ac7fd67b2a5d8')
b2sums=('1a60fe37191a406e55fa0b26899881b9b6534fd9b2ded8366b21118bdb1d9f173ecb158c5a5601784bf3836fa5d81114655ac08fd48d84fbd9a325242daef7a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
