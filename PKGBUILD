# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=directPA
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Direction Analysis for Pathways and Kinases"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-calibrate
  r-plotly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb97e41fc733cfdff3e40661804e649e')
b2sums=('fdf96d51043dcc743dfc4a5c3764c230f50650d2bf1d98b853ff2e290484f1241356069edacd9fcc155baa705be7b966c44b7d42c6ce0b1d82041f926e3dc1a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
