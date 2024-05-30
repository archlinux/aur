# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_pkgname=BSDA
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Basic Statistics and Data Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-e1071
)
optdepends=(
  r-dplyr
  r-ggplot2
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64d541438a5b355bc58630270bcfa6ae')
b2sums=('2b286b72b12f005a19d7c56b6b4fedb88d458bf4c70953be22d4db17b03218763ca64eb070209f713e368aab3ee3fc71de9c85c759ecf711ccc244ff10b69182')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
