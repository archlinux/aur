# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=fillpattern
_pkgver=1.0.5
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
md5sums=('374d01f5e2f485682a7fd1ca8a8bf987')
b2sums=('5c5b653058aab051436e96b996fde618e394eec7b39823e9b4886fc29e6e2ad24634aae8417bf82f838e918b02d551e0e79d083697d947ee5b7b6c8fc10c0060')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
