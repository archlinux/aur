# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=fillpattern
_pkgver=1.0.3
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
md5sums=('c0258b0c108644a2b1c76abcbb2fb498')
b2sums=('250dd109b1601f22eb90f4383c039f9c6d2c2fb2d876939014dc729870b64cf519839e771bfa11cadaefdd4b174e82d03530cff5cea1b064392bce3daffb47c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
