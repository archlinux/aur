# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zCompositions
_pkgver=1.5.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Treatment of Zeros, Left-Censored and Missing Values in Compositional Data Sets"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-nada
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13be19cca01949f8e1f2577efcc0fdbb')
b2sums=('62aefe21f250e456cbb91a9b9a06bd69353193d5ad856758364687dca445d5839929587d28bcc5318d8e730588c6858db69197fa0bb5de46f74210fe14f6a1b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
