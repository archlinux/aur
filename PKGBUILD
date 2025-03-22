# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=fillpattern
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Patterned Fills for 'ggplot2' and 'grid' Graphics"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-ggplot2
)
optdepends=(
  r-ragg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b52ba67e478a8d7d37c22f708fb6af31')
b2sums=('b623e94d844c73484ed04c1a7fef0654b1a76c4fc62bab296d576bc81410048a3ce48ad0816873eb57484169460644c136f5f970fc11e40fcab34d82fce5f0e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
