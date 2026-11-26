# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SNAGEE
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('1235d866f480872c8106d79d5e825f3e')
b2sums=('5fd9f42ff86159cdd31d653f48d5387beeadcbe582655ca9808ec2b56ac6235d82ce8d7fbf7bbe5a27a4dd1c8cc083f3cd8696310968ee6fbaa26cf4c2378a97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
